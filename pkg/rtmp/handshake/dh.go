package handshake

import (
	"crypto/rand"
	"math/big"
)

// RFC 2409 1024-bit MODP Group (Group 2)
var (
	dhP = mustParseBigInt("FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7EDEE386BFB5A899FA5AE9F24117C4B1FE649286651ECE65381FFFFFFFFFFFFFFFF", 16)
	dhG = big.NewInt(2)
)

func mustParseBigInt(s string, base int) *big.Int {
	n, ok := new(big.Int).SetString(s, base)
	if !ok {
		panic("failed to parse big int: " + s)
	}
	return n
}

// DHKeyPair represents a Diffie-Hellman key pair
type DHKeyPair struct {
	Private *big.Int
	Public  *big.Int
}

// DHGenerateKeyPair generates a new DH key pair
func DHGenerateKeyPair() (*DHKeyPair, error) {
	// Generate random private key (128 bytes = 1024 bits)
	privateBytes := make([]byte, 128)
	if _, err := rand.Read(privateBytes); err != nil {
		return nil, err
	}

	private := new(big.Int).SetBytes(privateBytes)
	// public = g^private mod p
	public := new(big.Int).Exp(dhG, private, dhP)

	return &DHKeyPair{
		Private: private,
		Public:  public,
	}, nil
}

// GetPublicKey returns the public key as bytes (128 bytes)
func (dh *DHKeyPair) GetPublicKey() []byte {
	pubBytes := dh.Public.Bytes()
	// Pad to 128 bytes
	result := make([]byte, 128)
	copy(result[128-len(pubBytes):], pubBytes)
	return result
}

// ComputeSharedSecret computes the shared secret from peer's public key
func (dh *DHKeyPair) ComputeSharedSecret(peerPubKey []byte) []byte {
	peerPublic := new(big.Int).SetBytes(peerPubKey)
	// shared = peerPublic^private mod p
	shared := new(big.Int).Exp(peerPublic, dh.Private, dhP)

	sharedBytes := shared.Bytes()
	// Pad to 128 bytes
	result := make([]byte, 128)
	copy(result[128-len(sharedBytes):], sharedBytes)
	return result
}

// GetDHOffset1 calculates DH public key offset for schema 0
// Based on librtmp's GetDHOffset1
func GetDHOffset1(handshake []byte) int {
	offset := 0
	ptr := 1532
	for i := 0; i < 4; i++ {
		offset += int(handshake[ptr+i])
	}
	res := (offset % 632) + 772
	if res+128 > 1531 {
		// Should not happen with valid handshake
		return 772
	}
	return res
}

// GetDHOffset2 calculates DH public key offset for schema 1
// Based on librtmp's GetDHOffset2
func GetDHOffset2(handshake []byte) int {
	offset := 0
	ptr := 768
	for i := 0; i < 4; i++ {
		offset += int(handshake[ptr+i])
	}
	res := (offset % 632) + 8
	if res+128 > 767 {
		// Should not happen with valid handshake
		return 8
	}
	return res
}
