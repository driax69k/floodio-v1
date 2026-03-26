# Floodio

**Floodio** is an Android-based, offline-resilient disaster information hub designed to provide critical crisis data—emergency news, evacuation areas, and hazard markers—even when traditional networks fail.

## 🌟 Key Features

-   **Offline Resiliency**: Uses a "store and forward" architecture to disseminate information without an active internet connection.
-   **Data Mules**: Users with temporary internet access act as "mules," carrying and syncing data to offline peers they encounter.
-   **Multi-Protocol Syncing**:
    -   **BLE (Bluetooth Low Energy)**: Automatic background syncing of small data packets (News, Hazard Markers).
    -   **Wi-Fi Direct (P2P)**: Manual high-bandwidth syncing for large assets like offline maps, images, and documents.
-   **Four-Tier Trust Model**: Prioritizes verified information to combat misinformation during crises:
    1.  **Official**: Government and emergency services.
    2.  **Admin-Trusted**: Verified community leaders.
    3.  **Personally-Trusted**: User-defined trusted contacts.
    4.  **Crowdsourced**: General unverified reports.
-   **Interactive Map**: Visualize flood zones, hazard markers, and safe zones using `flutter_map`.

## 🛠 Tech Stack

-   **Frontend**: [Flutter](https://flutter.dev/) (Dart)
-   **State Management**: [Riverpod 3.x](https://riverpod.dev/) (with `riverpod_generator`)
-   **Local Database**: [Drift](https://drift.simonbinder.eu/) (SQLite)
-   **Serialization**: [Protocol Buffers](https://protobuf.dev/) (via `protobuf` Dart package)
-   **Cryptography**: [package:cryptography](https://pub.dev/packages/cryptography) (Ed25519 signatures)
-   **P2P Communication**:
    -   `flutter_p2p_connection` (Wi-Fi Direct)
    -   `flutter_blue_plus` & `flutter_ble_peripheral` (BLE)

## 🏗 Architecture

Floodio follows a reactive, layered architecture:

-   **Providers (`lib/providers/`)**: Handle business logic, P2P state, and database interactions. Powered by Riverpod Generator.
-   **Database (`lib/database/`)**: Strong-typed SQLite schema and queries using Drift.
-   **Protos (`lib/protos/`)**: Manually maintained or generated Protocol Buffer models for efficient cross-device syncing.
-   **Crypto (`lib/crypto/`)**: Services for identity management and message signing/verification.
-   **Utils (`lib/utils/`)**: Helpers for permissions, bloom filters, and platform-specific logic.

---

## 📖 Documentation Index

1.  **[Installation Guide](INSTALLATION.md)**: How to set up your local environment and run the project.
2.  **[Development Guide](DEVELOPMENT.md)**: Details on code generation, protobuf management, and architectural patterns.
3.  **[Deployment Guide](DEPLOYMENT.md)**: How to build and release the application.
