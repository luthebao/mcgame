package handshake

import (
	"crypto/hmac"
	"crypto/rc4"
	"crypto/sha256"
	"io"
)

const (
	// RTMPE requires discarding the first 1536 bytes of keystream
	RC4SkipBytes = 1536
)

// RC4Cipher wraps RC4 encryption for RTMPE
type RC4Cipher struct {
	cipher *rc4.Cipher
}

// NewRC4Cipher creates a new RC4 cipher with the given key
// and skips the first 1536 bytes of keystream as per RTMPE spec
func NewRC4Cipher(key []byte) (*RC4Cipher, error) {
	cipher, err := rc4.NewCipher(key)
	if err != nil {
		return nil, err
	}

	// Skip first 1536 bytes of keystream
	skip := make([]byte, RC4SkipBytes)
	cipher.XORKeyStream(skip, skip)

	return &RC4Cipher{cipher: cipher}, nil
}

// XORKeyStream encrypts/decrypts data in place
func (c *RC4Cipher) XORKeyStream(dst, src []byte) {
	c.cipher.XORKeyStream(dst, src)
}

// InitRC4Encryption derives RC4 keys from shared secret and public keys
// Based on librtmp's InitRC4Encryption function
//
// For server-side:
//   - keyOut = HMAC(secret, clientPubKey) - used to encrypt data sent to client
//   - keyIn = HMAC(secret, serverPubKey) - used to decrypt data received from client
func InitRC4Encryption(secretKey []byte, clientPubKey []byte, serverPubKey []byte) (keyIn *RC4Cipher, keyOut *RC4Cipher, err error) {
	// Derive outbound key: HMAC-SHA256(secretKey, clientPubKey)
	h := hmac.New(sha256.New, secretKey)
	h.Write(clientPubKey)
	keyOutBytes := h.Sum(nil)[:16]

	// Derive inbound key: HMAC-SHA256(secretKey, serverPubKey)
	h = hmac.New(sha256.New, secretKey)
	h.Write(serverPubKey)
	keyInBytes := h.Sum(nil)[:16]

	keyIn, err = NewRC4Cipher(keyInBytes)
	if err != nil {
		return nil, nil, err
	}

	keyOut, err = NewRC4Cipher(keyOutBytes)
	if err != nil {
		return nil, nil, err
	}

	return keyIn, keyOut, nil
}

// RC4Reader wraps a reader with RC4 decryption
type RC4Reader struct {
	reader io.Reader
	cipher *RC4Cipher
}

// NewRC4Reader creates a new RC4-decrypting reader
func NewRC4Reader(r io.Reader, cipher *RC4Cipher) *RC4Reader {
	return &RC4Reader{
		reader: r,
		cipher: cipher,
	}
}

// Read reads and decrypts data
func (r *RC4Reader) Read(p []byte) (n int, err error) {
	n, err = r.reader.Read(p)
	if n > 0 {
		r.cipher.XORKeyStream(p[:n], p[:n])
	}
	return n, err
}

// RC4Writer wraps a writer with RC4 encryption
type RC4Writer struct {
	writer    io.Writer
	cipher    *RC4Cipher
	byteCount uint64
}

// NewRC4Writer creates a new RC4-encrypting writer
func NewRC4Writer(w io.Writer, cipher *RC4Cipher) *RC4Writer {
	return &RC4Writer{
		writer:    w,
		cipher:    cipher,
		byteCount: 0,
	}
}

// Write encrypts and writes data
func (w *RC4Writer) Write(p []byte) (n int, err error) {
	// Create a copy to avoid modifying original data
	encrypted := make([]byte, len(p))
	w.cipher.XORKeyStream(encrypted, p)
	w.byteCount += uint64(len(p))
	return w.writer.Write(encrypted)
}

// EncryptedReadWriter combines encrypted reader and writer
type EncryptedReadWriter struct {
	*RC4Reader
	*RC4Writer
}

// NewEncryptedReadWriter creates a combined encrypted read/writer
func NewEncryptedReadWriter(r io.Reader, w io.Writer, keyIn, keyOut *RC4Cipher) *EncryptedReadWriter {
	return &EncryptedReadWriter{
		RC4Reader: NewRC4Reader(r, keyIn),
		RC4Writer: NewRC4Writer(w, keyOut),
	}
}
