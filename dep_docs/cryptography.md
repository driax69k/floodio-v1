# Context & Usage Guide: Dart/Flutter `cryptography` Ecosystem

## 1. Overview
This repository provides popular, cross-platform cryptographic algorithms for Dart and Flutter developers. It defaults to high-performance, platform-provided implementations (Android `javax.crypto`, Apple `CryptoKit`, Web Crypto API) and automatically falls back to pure Dart implementations when native APIs are unavailable. 

**Maintained by:** terrier989
**License:** Apache License 2.0

### Core Packages
1. **`cryptography`** (`^2.9.0`): The core API and pure Dart/Web Crypto implementations.
2. **`cryptography_flutter`** (`^2.3.4`): Flutter plugin that delegates to native OS APIs (Android, iOS, macOS) for up to 100x performance gains.
3. **`jwk`** (`^0.2.4`): JSON Web Key (JWK) encoding and decoding.

---

## 2. Key Concepts & Architecture

### 2.1. Key Representations
Keys are opaque and asynchronous by default (they might not reside in memory). 
* **`SecretKey`**: Used for ciphers, MACs, and KDFs.
* **`KeyPair`**: 
  * `SimpleKeyPair` (Ed25519, X25519)
  * `EcKeyPairData` (P-256, P-384, P-521)
  * `RsaKeyPairData` (RSA)
* **`PublicKey`**: `SimplePublicKey`, `EcPublicKey`, `RsaPublicKey`.

*Note: To access actual bytes in memory, developers must extract them (e.g., `await secretKey.extractBytes()`), which returns data classes like `SecretKeyData` or `SimpleKeyPairData`.*

### 2.2. Wands (Recommended API)
For higher abstraction and performance, the library recommends using **Wands**. These perform operations with a fixed, "invisible" key.
* `CipherWand`
* `KeyExchangeWand`
* `SignatureWand`
*(Note: The library plans to make Wands the default API in the upcoming 3.x release).*

### 2.3. Cryptography Factories
The `Cryptography` class provides factory methods for algorithms.
* **`DartCryptography`**: Pure Dart (works everywhere).
* **`BrowserCryptography`**: Default. Uses Web Crypto API (JS/WASM) when possible, falls back to Dart.
* **`FlutterCryptography`**: Provided by `cryptography_flutter`. Uses native OS APIs.

### 2.4. Random Number Generators (RNG)
* **Default**: `Random.secure()`
* **Fast**: `SecureRandom.fast` (ChaCha-based, up to 0.25 GB/s).
* **Testing**: `SecureRandom.forTesting(seed: 42)` (Deterministic, highly recommended for unit tests).

---

## 3. Supported Algorithms

* **Ciphers (Authenticated Encryption):** `AesGcm` (Recommended), `AesCbc`, `AesCtr`, `Chacha20.poly1305Aead`, `Xchacha20.poly1305Aead`.
* **Digital Signatures:** `Ed25519` (Recommended), `Ecdsa` (p256, p384, p521), `RsaPss`, `RsaSsaPkcs1v15`.
* **Key Exchange:** `X25519` (Recommended), `Ecdh` (p256, p384, p521).
* **Password Hashing / KDF:** `Argon2id` (Highly Recommended), `Pbkdf2`, `Hkdf`, `Hchacha20`.
* **Hashes:** `Sha256`, `Sha384`, `Sha512`, `Sha1`, `Sha224`, `Blake2b`, `Blake2s`.
* **MACs:** `Hmac`, `Blake2b`, `Blake2s`, `Poly1305`.

---

## 4. Common Code Patterns

### 4.1. Setup / Dependencies
```yaml
dependencies:
  cryptography: ^2.9.0
  cryptography_flutter: ^2.3.4 # If using Flutter
  jwk: ^0.2.4 # If JWK encoding/decoding is needed
```

### 4.2. Authenticated Encryption (AES-GCM)
```dart
import 'package:cryptography/cryptography.dart';

Future<void> encryptDecryptExample() async {
  final algorithm = AesGcm.with256bits();
  final secretKey = await algorithm.newSecretKey();
  
  // Encrypt
  final secretBox = await algorithm.encryptString(
    'Hello World!',
    secretKey: secretKey,
  );
  
  // secretBox contains: .nonce, .cipherText, .mac
  // Can be concatenated for network transport: secretBox.concatenation()

  // Decrypt
  final clearText = await algorithm.decryptString(
    secretBox,
    secretKey: secretKey,
  );
}
```

### 4.3. Digital Signatures (Ed25519)
```dart
import 'package:cryptography/cryptography.dart';

Future<void> signAndVerify() async {
  final algorithm = Ed25519();
  final keyPair = await algorithm.newKeyPair();
  final message = [1, 2, 3];

  // Sign
  final signature = await algorithm.sign(message, keyPair: keyPair);
  
  // Verify
  final isCorrect = await algorithm.verify(message, signature: signature);
}
```

### 4.4. Key Agreement (X25519)
```dart
import 'package:cryptography/cryptography.dart';

Future<void> keyExchange() async {
  final algorithm = X25519();
  final aliceKeyPair = await algorithm.newKeyPair();
  final bobKeyPair = await algorithm.newKeyPair();
  final bobPublicKey = await bobKeyPair.extractPublicKey();

  // Alice calculates shared secret
  final sharedSecret = await algorithm.sharedSecretKey(
    keyPair: aliceKeyPair,
    remotePublicKey: bobPublicKey,
  );
}
```

### 4.5. Password Hashing (Argon2id)
```dart
import 'package:cryptography/cryptography.dart';

Future<void> hashPassword() async {
  final algorithm = Argon2id(
    memory: 10 * 1000, // 10 MB
    parallelism: 2,
    iterations: 1,
    hashLength: 32,
  );
  
  final secretKey = await algorithm.deriveKeyFromPassword(
    password: 'my_secure_password',
    nonce: [1, 2, 3], // Salt
  );
}
```

### 4.6. JWK Encoding / Decoding
```dart
import 'package:cryptography/cryptography.dart';
import 'package:jwk/jwk.dart';

Future<void> jwkExample() async {
  // Encode
  final keyPair = await RsaPss().newKeyPair();
  final jwk = Jwk.fromKeyPair(keyPair);
  final jsonMap = jwk.toJson();

  // Decode
  final decodedJwk = Jwk.fromJson({
    'kty': 'OCT',
    'alg': 'A128KW',
    'k': 'GawgguFyGrWKav7AX4VKUg',
  });
  final secretKey = decodedJwk.toSecretKey();
}
```

### 4.7. Deterministic Testing
```dart
import 'package:cryptography/cryptography.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    // Forces deterministic key generation for tests
    Cryptography.instance = Cryptography.instance.withRandom(
      SecureRandom.forTesting(seed: 42)
    );
  });
}
```

---

## 5. Flutter Integration Notes (`cryptography_flutter`)
When generating code for Flutter apps, always recommend including `cryptography_flutter`. 
* **Initialization:** As of `2.2.0`, developers **no longer need** to call `CryptographyFlutter.enable()` in `main()`. The plugin uses the new Flutter plugin convention.
* **Isolates:** The plugin automatically handles background isolates for large payloads (e.g., `BackgroundAesGcm`, `BackgroundChacha20`) using Flutter's `compute` function to prevent UI thread blocking. Small payloads are processed synchronously to avoid isolate overhead.
