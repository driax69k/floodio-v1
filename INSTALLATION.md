# Installation Guide

Follow these steps to set up the **Floodio** development environment and get the project running.

## 📋 Prerequisites

1.  **Flutter SDK**: [Install Flutter](https://docs.flutter.dev/get-started/install) (Stable channel, version >= 3.11.0).
2.  **Android Studio** (or VS Code): Recommended for Android development.
3.  **Git**: For cloning the repository.

---

## 🚀 Setup Steps

### 1. Clone the Repository
```bash
git clone <repository_url>
cd floodio
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Code (Crucial Step)
Floodio relies heavily on dynamic code generation for the database (Drift) and state management (Riverpod). **If you see numerous analysis errors (e.g., missing `.g.dart` files), run this command:**

```bash
dart run build_runner build --delete-conflicting-outputs
```

> **Note**: For continuous development, you can use `watch` to automatically regenerate code on file changes:
> `dart run build_runner watch --delete-conflicting-outputs`

### 4. Protobuf Setup
If you are modifying `.proto` files, you will need the `protoc` compiler. However, the project includes manually restored versions of the Dart models in `lib/protos/models.pb.dart` for quick setup on machines without the native protobuf toolchain.

*See **[DEVELOPMENT.md](DEVELOPMENT.md)** for details on manual vs. automated protobuf management.*

---

## 🏃 Running the App

### Via CLI
Connect an Android device (physical recommended for BLE/P2P testing) and run:
```bash
flutter run
```

### Via VS Code
1.  Open the project in VS Code.
2.  Press `F5` to start debugging.

---

## 🧪 Verification
After running the build runner, confirm that there are no static analysis errors:
```bash
flutter analyze
```
*Expected: "No issues found!"*
