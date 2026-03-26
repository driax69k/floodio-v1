# Development Guide

This guide is for developers contributing to the **Floodio** codebase. It covers architectural patterns, code generation, and specific troubleshooting for P2P protocols.

## 🏗 Reactive Architecture (Drift + Riverpod)

Floodio uses a reactive loop between the local database and the UI:

1.  **State Management**: `lib/providers/` contains Riverpod providers.
    -   We use `StreamProvider` and `StreamNotifier` to watch Drift queries.
    -   When a database table changes (e.g., a new hazard marker is synced), any watching providers automatically emit new data.
    -   The UI reacts automatically via `ref.watch()`.

2.  **Code Generation**: Always keep `build_runner` running or run it after making changes to `@riverpod` or `@DriftDatabase` annotations.

---

## 🛰 Protocol Buffers (Serialization)

We use Protocol Buffers for efficient binary serialization over BLE and Wi-Fi Direct.

### Manual vs. Automated Generation
Due to the cross-platform nature of the `protoc` compiler, this project provides two paths:

1.  **Manual Restore (Fast Setup)**:
    The files in `lib/protos/*.pb.dart` have been manually created to match the definitions in `protos/*.proto`. This allows developers to run the project without having the `protoc` compiler installed.

2.  **Automated Generation (Standard)**:
    If you modify the `.proto` files, you **must** use the official compiler:
    ```bash
    # 1. Install protoc and the dart plugin
    dart pub global activate protoc_plugin

    # 2. Run the compiler from the project root
    protoc --dart_out=lib/protos -Iprotos protos/models.proto
    ```

---

## 📡 Testing P2P Features

Testing BLE and Wi-Fi Direct is best done on **physical Android devices**:

1.  **Permissions**: Ensure Location, Bluetooth, and Nearby Devices permissions are granted.
2.  **Bluetooth Scanning**: BLE scanning requires Location Services (GPS) to be ON on most Android versions.
3.  **Wi-Fi Direct**: Some devices may require a manual confirmation dialog (part of the standard Android P2P API).

### Troubleshooting Sync Issues
-   **Check the Logs**: Use `adb logcat` or the VS Code Debug Console to look for P2P connection errors.
-   **Device Compatibility**: Wi-Fi Direct (P2P) performance can vary significantly between device manufacturers.
-   **BLE Range**: BLE is designed for short-range; keep devices within 2-5 meters for optimal background syncing.

---

## 🛠 Code Hygiene

-   **Analyzer**: Always run `flutter analyze` before committing.
-   **Linting**: Follow the standard `flutter_lints` rules defined in `analysis_options.yaml`.
-   **Architecture**: Keep business logic in providers and UI code in `ConsumerWidget` or `ConsumerStatefulWidget`.
