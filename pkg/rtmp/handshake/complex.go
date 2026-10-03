//
// Complex RTMPE Handshake implementation
// Based on livego's implementation and librtmp
//

package handshake

import (
	"bytes"
	"crypto/hmac"
	"crypto/rand"
	"crypto/sha256"
	"encoding/binary"
	"fmt"
	"io"
	"time"
)

var (
	// Adobe Flash Player key for client
	hsClientFullKey = []byte{
		'G', 'e', 'n', 'u', 'i', 'n', 'e', ' ', 'A', 'd', 'o', 'b', 'e', ' ',
		'F', 'l', 'a', 's', 'h', ' ', 'P', 'l', 'a', 'y', 'e', 'r', ' ',
		'0', '0', '1',
		0xF0, 0xEE, 0xC2, 0x4A, 0x80, 0x68, 0xBE, 0xE8, 0x2E, 0x00, 0xD0, 0xD1,
		0x02, 0x9E, 0x7E, 0x57, 0x6E, 0xEC, 0x5D, 0x2D, 0x29, 0x80, 0x6F, 0xAB,
		0x93, 0xB8, 0xE6, 0x36, 0xCF, 0xEB, 0x31, 0xAE,
	}

	// Adobe Flash Media Server key for server
	hsServerFullKey = []byte{
		'G', 'e', 'n', 'u', 'i', 'n', 'e', ' ', 'A', 'd', 'o', 'b', 'e', ' ',
		'F', 'l', 'a', 's', 'h', ' ', 'M', 'e', 'd', 'i', 'a', ' ',
		'S', 'e', 'r', 'v', 'e', 'r', ' ',
		'0', '0', '1',
		0xF0, 0xEE, 0xC2, 0x4A, 0x80, 0x68, 0xBE, 0xE8, 0x2E, 0x00, 0xD0, 0xD1,
		0x02, 0x9E, 0x7E, 0x57, 0x6E, 0xEC, 0x5D, 0x2D, 0x29, 0x80, 0x6F, 0xAB,
		0x93, 0xB8, 0xE6, 0x36, 0xCF, 0xEB, 0x31, 0xAE,
	}

	hsClientPartialKey = hsClientFullKey[:30]
	hsServerPartialKey = hsServerFullKey[:36]
)

// ComplexHandshakeConfig holds configuration for complex handshake
type ComplexHandshakeConfig struct {
	ReadTimeout  time.Duration
	WriteTimeout time.Duration
}

// hsMakeDigest creates HMAC-SHA256 digest
func hsMakeDigest(key []byte, src []byte, gap int) []byte {
	h := hmac.New(sha256.New, key)
	if gap <= 0 {
		h.Write(src)
	} else {
		h.Write(src[:gap])
		h.Write(src[gap+32:])
	}
	return h.Sum(nil)
}

// hsCalcDigestPos calculates the position of the digest in the handshake packet
func hsCalcDigestPos(p []byte, base int) int {
	pos := 0
	for i := 0; i < 4; i++ {
		pos += int(p[base+i])
	}
	pos = (pos % 728) + base + 4
	return pos
}

// hsFindDigest finds and validates the digest in the handshake packet
func hsFindDigest(p []byte, key []byte, base int) int {
	gap := hsCalcDigestPos(p, base)
	digest := hsMakeDigest(key, p, gap)
	if !bytes.Equal(p[gap:gap+32], digest) {
		return -1
	}
	return gap
}

// hsParse1 parses C1 and extracts the digest
func hsParse1(p []byte, peerkey []byte, key []byte) (ok bool, digest []byte) {
	var pos int
	// Try schema 1 first (digest at offset 772)
	if pos = hsFindDigest(p, peerkey, 772); pos == -1 {
		// Try schema 0 (digest at offset 8)
		if pos = hsFindDigest(p, peerkey, 8); pos == -1 {
			return false, nil
		}
	}
	ok = true
	digest = hsMakeDigest(key, p[pos:pos+32], -1)
	return
}

// hsCreate01 creates S0S1 with proper digest
// hsCreate01 creates S0S1 with proper digest
// For RTMPE (encrypted), always use schema 1 (digest at 772)
func hsCreate01(p []byte, serverTime uint32, serverVer uint32, key []byte, encrypted bool) {
	p[0] = 3
	p1 := p[1:]
	rand.Read(p1[8:])
	binary.BigEndian.PutUint32(p1[0:4], serverTime)
	binary.BigEndian.PutUint32(p1[4:8], serverVer)

	// Use schema 1 for encrypted, schema 0 for plain
	var base int
	if encrypted {
		base = 772
	} else {
		base = 8
	}
	gap := hsCalcDigestPos(p1, base)
	digest := hsMakeDigest(key, p1, gap)
	copy(p1[gap:], digest)
}

// hsCreate2 creates S2 with proper digest
func hsCreate2(p []byte, key []byte) {
	rand.Read(p)
	gap := len(p) - 32
	digest := hsMakeDigest(key, p, gap)
	copy(p[gap:], digest)
}

// ComplexHandshakeWithClient performs complex handshake as server
// Returns the RTMPE version and RC4 ciphers for encryption (nil if not RTMPE)
func ComplexHandshakeWithClient(r io.Reader, w io.Writer, config *ComplexHandshakeConfig) (rtmpeVersion byte, keyIn *RC4Cipher, keyOut *RC4Cipher, err error) {
	var random [(1 + 1536*2) * 2]byte

	C0C1C2 := random[:1536*2+1]
	C0 := C0C1C2[:1]
	C1 := C0C1C2[1 : 1536+1]
	C0C1 := C0C1C2[:1536+1]
	C2 := C0C1C2[1536+1:]

	S0S1S2 := random[1536*2+1:]
	S0 := S0S1S2[:1]
	S1 := S0S1S2[1 : 1536+1]
	S2 := S0S1S2[1536+1:]

	// Read C0C1
	if _, err = io.ReadFull(r, C0C1); err != nil {
		return 0, nil, nil, fmt.Errorf("failed to read C0C1: %w", err)
	}

	rtmpeVersion = C0[0]

	// Check version - accept 3 (RTMP) or 6 (RTMPE) or 8 (RTMPE type 8)
	if rtmpeVersion != 3 && rtmpeVersion != 6 && rtmpeVersion != 8 {
		return 0, nil, nil, fmt.Errorf("unsupported RTMP version: %d", rtmpeVersion)
	}

	encrypted := rtmpeVersion == 6 || rtmpeVersion == 8

	// For RTMPE, we respond with the same version
	S0[0] = rtmpeVersion

	cliTime := binary.BigEndian.Uint32(C1[0:4])
	srvTime := cliTime
	srvVer := uint32(0x0d0e0a0d)

	cliVer := binary.BigEndian.Uint32(C1[4:8])

	// Variables for RTMPE
	var serverDH *DHKeyPair
	var clientPubKey []byte
	var serverPubKey []byte
	var schema int = -1

	if cliVer != 0 {
		// Complex handshake - client supports it
		var ok bool
		var digest []byte

		// Try schema 1 (digest at 772, DH at 768) first, then schema 0 (digest at 8, DH at 1532)
		if ok, digest = hsParse1(C1, hsClientPartialKey, hsServerFullKey); !ok {
			// Fall back to simple handshake
			copy(S1, C1)
			copy(S2, C1)
		} else {
			// Determine which schema the client used (for DH offset)
			if hsFindDigest(C1, hsClientPartialKey, 772) != -1 {
				schema = 1
			} else {
				schema = 0
			}

			// For RTMPE, perform DH key exchange
			if encrypted {
				serverDH, err = DHGenerateKeyPair()
				if err != nil {
					return 0, nil, nil, fmt.Errorf("failed to generate DH key pair: %w", err)
				}

				// Extract client's DH public key from C1
				var dhPosClient int
				if schema == 1 {
					dhPosClient = GetDHOffset2(C1)
				} else {
					dhPosClient = GetDHOffset1(C1)
				}
				clientPubKey = make([]byte, 128)
				copy(clientPubKey, C1[dhPosClient:dhPosClient+128])
			}

			// Create S0S1 with proper digest (use schema 1 for RTMPE)
			hsCreate01(S0S1S2[:1537], srvTime, srvVer, hsServerPartialKey, encrypted)
			// Overwrite S0 with correct version
			S0[0] = rtmpeVersion

			// For RTMPE, embed our DH public key into S1
			if encrypted && serverDH != nil {
				// For RTMPE, always use schema 1 offsets
				dhPosServer := GetDHOffset2(S1)
				serverPubKey = serverDH.GetPublicKey()
				copy(S1[dhPosServer:], serverPubKey)

				// Need to recalculate digest after embedding DH key
				// Schema 1 uses base 772 for digest
				gap := hsCalcDigestPos(S1, 772)
				digestNew := hsMakeDigest(hsServerPartialKey, S1, gap)
				copy(S1[gap:], digestNew)
			}

			// Create S2 with proper digest
			hsCreate2(S2, digest)
		}
	} else {
		// Simple handshake - echo C1
		copy(S1, C1)
		copy(S2, C1)
	}

	// Send S0S1S2
	if _, err = w.Write(S0S1S2); err != nil {
		return 0, nil, nil, fmt.Errorf("failed to write S0S1S2: %w", err)
	}

	// Read C2
	if _, err = io.ReadFull(r, C2); err != nil {
		return 0, nil, nil, fmt.Errorf("failed to read C2: %w", err)
	}

	// For RTMPE, derive RC4 keys from DH shared secret
	if encrypted && serverDH != nil && clientPubKey != nil {
		sharedSecret := serverDH.ComputeSharedSecret(clientPubKey)

		// Initialize RC4 encryption
		// From librtmp: server calls InitRC4Encryption(secret, clientPubKey, serverPubKey)
		// keyOut = HMAC(secret, clientPubKey) - what server uses to encrypt
		// keyIn = HMAC(secret, serverPubKey) - what server uses to decrypt
		keyIn, keyOut, err = InitRC4Encryption(sharedSecret, clientPubKey, serverPubKey)
		if err != nil {
			return 0, nil, nil, fmt.Errorf("failed to initialize RC4: %w", err)
		}
	}

	return rtmpeVersion, keyIn, keyOut, nil
}
