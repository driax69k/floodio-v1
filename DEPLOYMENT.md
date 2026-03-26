# Deployment Guide

This guide describes how to build, sign, and release the **Floodio** Android application.

## 📱 Android Deployment

### 1. Versioning
Update the `version` field in `pubspec.yaml` (e.g., `version: 1.0.0+1`).

### 2. Sign the App
To release on the Google Play Store or distribute an APK, you **must** sign your app.

1.  Create a keystore file:
    ```bash
    keytool -genkey -v -keystore release-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
    ```
2.  Create `android/key.properties` with the following contents:
    ```properties
    storePassword=<password>
    keyPassword=<password>
    keyAlias=key
    storeFile=<path_to_keystore_file>
    ```

### 3. Build the Release Bundle (AAB)
The preferred format for the Play Store is the Android App Bundle.
```bash
flutter build appbundle
```

### 4. Build the Release APK
For direct distribution (e.g., via sideloading), build an APK:
```bash
flutter build apk --split-per-abi
```

---

## 🏗 CI/CD Recommendations

For professional development, it is recommended to automate the build and verification process using **GitHub Actions**.

### Example Workflow (`.github/workflows/main.yml`):
```yaml
name: Flutter CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --debug
```

---

## ⚠️ Security Notes

-   **Secrets Management**: Never commit your `key.properties` or `.jks` files to version control. Use CI secrets to inject these during the build process.
-   **ProGuard/R8**: Floodio relies on complex serialization (Drift, Protobuf). If you enable code shrinking, ensure you have the correct ProGuard rules to prevent stripping necessary reflection-based logic.
