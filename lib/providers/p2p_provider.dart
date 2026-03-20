import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_p2p_connection/flutter_p2p_connection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../crypto/crypto_service.dart';
import '../database/database.dart';
import '../protos/models.pb.dart' as pb;
import 'database_provider.dart';

part 'p2p_provider.g.dart';

class P2pState {
  final bool isHosting;
  final bool isScanning;
  final bool isSyncing;
  final String? syncMessage;
  final HotspotHostState? hostState;
  final HotspotClientState? clientState;
  final List<BleDiscoveredDevice> discoveredDevices;
  final List<String> receivedTexts;

  const P2pState({
    this.isHosting = false,
    this.isScanning = false,
    this.isSyncing = false,
    this.syncMessage,
    this.hostState,
    this.clientState,
    this.discoveredDevices = const [],
    this.receivedTexts = const [],
  });

  P2pState copyWith({
    bool? isHosting,
    bool? isScanning,
    bool? isSyncing,
    String? syncMessage,
    HotspotHostState? hostState,
    bool clearHostState = false,
    HotspotClientState? clientState,
    bool clearClientState = false,
    List<BleDiscoveredDevice>? discoveredDevices,
    List<String>? receivedTexts,
  }) {
    return P2pState(
      isHosting: isHosting ?? this.isHosting,
      isScanning: isScanning ?? this.isScanning,
      isSyncing: isSyncing ?? this.isSyncing,
      syncMessage: syncMessage ?? this.syncMessage,
      hostState: clearHostState ? null : (hostState ?? this.hostState),
      clientState: clearClientState ? null : (clientState ?? this.clientState),
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      receivedTexts: receivedTexts ?? this.receivedTexts,
    );
  }
}

@Riverpod(keepAlive: true)
class P2pService extends _$P2pService {
  FlutterP2pHost? _host;
  FlutterP2pClient? _client;

  StreamSubscription? _hostStateSub;
  StreamSubscription? _clientStateSub;
  StreamSubscription? _hostClientListSub;
  StreamSubscription? _hostTextSub;
  StreamSubscription? _clientTextSub;
  StreamSubscription? _scanSub;

  @override
  P2pState build() {
    ref.onDispose(() {
      _hostStateSub?.cancel();
      _clientStateSub?.cancel();
      _hostClientListSub?.cancel();
      _hostTextSub?.cancel();
      _clientTextSub?.cancel();
      _scanSub?.cancel();
      _host?.dispose();
      _client?.dispose();
    });
    return const P2pState();
  }

  Future<void> startHosting() async {
    if (_host != null) return;

    state = state.copyWith(isHosting: true, syncMessage: 'Initializing host...');

    _host = FlutterP2pHost();
    await _host!.initialize();

    if (!await _host!.checkP2pPermissions()) await _host!.askP2pPermissions();
    if (!await _host!.checkBluetoothPermissions()) await _host!.askBluetoothPermissions();
    if (!await _host!.checkLocationEnabled()) await _host!.enableLocationServices();
    if (!await _host!.checkWifiEnabled()) await _host!.enableWifiServices();
    if (!await _host!.checkBluetoothEnabled()) await _host!.enableBluetoothServices();

    _hostStateSub = _host!.streamHotspotState().listen((state) {
      this.state = this.state.copyWith(hostState: state);
    });

    _hostClientListSub = _host!.streamClientList().listen((clients) {
      if (clients.isNotEmpty) {
        state = state.copyWith(syncMessage: 'Client connected. Initiating sync...');
        _sendManifest();
      } else {
        state = state.copyWith(syncMessage: 'Waiting for clients...');
      }
    });

    _hostTextSub = _host!.streamReceivedTexts().listen((text) {
      _handleReceivedText(text);
    });

    try {
      await _host!.createGroup(advertise: true);
      state = state.copyWith(syncMessage: 'Hosting network. Waiting for peers...');
    } catch (e) {
      print("Failed to create group: $e");
      state = state.copyWith(syncMessage: 'Failed to start host: $e');
      await stopHosting();
    }
  }

  Future<void> stopHosting() async {
    await _host?.removeGroup();
    await _host?.dispose();
    _hostStateSub?.cancel();
    _hostClientListSub?.cancel();
    _hostTextSub?.cancel();
    _host = null;
    state = state.copyWith(isHosting: false, clearHostState: true, syncMessage: 'Host stopped.');
  }

  Future<void> startScanning() async {
    if (_client != null) return;

    state = state.copyWith(isScanning: true, discoveredDevices: [], syncMessage: 'Initializing scanner...');

    _client = FlutterP2pClient();
    await _client!.initialize();

    if (!await _client!.checkP2pPermissions()) await _client!.askP2pPermissions();
    if (!await _client!.checkBluetoothPermissions()) await _client!.askBluetoothPermissions();
    if (!await _client!.checkLocationEnabled()) await _client!.enableLocationServices();
    if (!await _client!.checkWifiEnabled()) await _client!.enableWifiServices();
    if (!await _client!.checkBluetoothEnabled()) await _client!.enableBluetoothServices();

    _clientStateSub = _client!.streamHotspotState().listen((state) {
      final wasActive = this.state.clientState?.isActive ?? false;
      this.state = this.state.copyWith(clientState: state);
      if (!wasActive && state.isActive) {
        this.state = this.state.copyWith(syncMessage: 'Connected to host. Initiating sync...');
        _sendManifest();
      } else if (wasActive && !state.isActive) {
        this.state = this.state.copyWith(syncMessage: 'Disconnected from host.');
      }
    });

    _clientTextSub = _client!.streamReceivedTexts().listen((text) {
      _handleReceivedText(text);
    });

    try {
      state = state.copyWith(syncMessage: 'Scanning for nearby devices...');
      _scanSub = await _client!.startScan((devices) {
        state = state.copyWith(discoveredDevices: devices);
      });
    } catch (e) {
      print("Failed to start scan: $e");
      state = state.copyWith(isScanning: false, syncMessage: 'Scan failed: $e');
    }
  }

  Future<void> connectToDevice(BleDiscoveredDevice device) async {
    if (_client == null) return;
    state = state.copyWith(syncMessage: 'Connecting to ${device.deviceName}...');
    await stopScanning();
    try {
      await _client!.connectWithDevice(device);
    } catch (e) {
      print("Connection failed: $e");
      state = state.copyWith(syncMessage: 'Connection failed: $e');
    }
  }

  Future<void> stopScanning() async {
    await _scanSub?.cancel();
    await _client?.stopScan();
    state = state.copyWith(isScanning: false);
  }

  Future<void> disconnect() async {
    await stopScanning();
    await _client?.disconnect();
    await _client?.dispose();
    _clientStateSub?.cancel();
    _clientTextSub?.cancel();
    _scanSub?.cancel();
    _client = null;
    state = state.copyWith(clearClientState: true, discoveredDevices: [], syncMessage: 'Disconnected.');
  }

  void _handleReceivedText(String text) async {
    print("Received text: $text");
    try {
      final json = jsonDecode(text);
      if (json is Map<String, dynamic>) {
        if (json['type'] == 'manifest') {
          await _handleManifest(json);
          return;
        } else if (json['type'] == 'payload') {
          await _handlePayload(json);
          return;
        }
      }
    } catch (e) {
      // Not JSON, ignore and treat as normal text
    }

    state = state.copyWith(
      receivedTexts: [...state.receivedTexts, text],
    );
  }

  Future<void> _sendManifest() async {
    final db = ref.read(databaseProvider);

    final hazardMax = await (db.select(db.hazardMarkers)
          ..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();

    final newsMax = await (db.select(db.newsItems)
          ..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();

    final manifest = {
      'type': 'manifest',
      'maxHazardTs': hazardMax?.timestamp ?? 0,
      'maxNewsTs': newsMax?.timestamp ?? 0,
    };

    await broadcastText(jsonEncode(manifest));
  }

  Future<void> _handleManifest(Map<String, dynamic> json) async {
    state = state.copyWith(isSyncing: true, syncMessage: 'Comparing data...');
    final peerMaxHazardTs = json['maxHazardTs'] as int? ?? 0;
    final peerMaxNewsTs = json['maxNewsTs'] as int? ?? 0;

    final db = ref.read(databaseProvider);

    final newHazards = await (db.select(db.hazardMarkers)
          ..where((t) => t.timestamp.isBiggerThanValue(peerMaxHazardTs)))
        .get();

    final newNews = await (db.select(db.newsItems)
          ..where((t) => t.timestamp.isBiggerThanValue(peerMaxNewsTs)))
        .get();

    if (newHazards.isEmpty && newNews.isEmpty) {
      state = state.copyWith(isSyncing: false, syncMessage: 'Up to date.');
      return;
    }

    state = state.copyWith(syncMessage: 'Sending ${newHazards.length} markers and ${newNews.length} news...');

    final payload = pb.SyncPayload();

    for (final h in newHazards) {
      payload.markers.add(pb.HazardMarker(
        id: h.id,
        latitude: h.latitude,
        longitude: h.longitude,
        type: h.type,
        description: h.description,
        timestamp: Int64(h.timestamp),
        senderId: h.senderId,
        signature: h.signature ?? '',
        trustTier: h.trustTier,
      ));
    }

    for (final n in newNews) {
      payload.news.add(pb.NewsItem(
        id: n.id,
        title: n.title,
        content: n.content,
        timestamp: Int64(n.timestamp),
        senderId: n.senderId,
        signature: n.signature ?? '',
        trustTier: n.trustTier,
      ));
    }

    final encoded = base64Encode(payload.writeToBuffer());
    await broadcastText(jsonEncode({'type': 'payload', 'data': encoded}));
    state = state.copyWith(isSyncing: false, syncMessage: 'Data sent successfully.');
  }

  Future<void> _handlePayload(Map<String, dynamic> json) async {
    state = state.copyWith(isSyncing: true, syncMessage: 'Receiving data...');
    final data = base64Decode(json['data']);
    final payload = pb.SyncPayload.fromBuffer(data);

    state = state.copyWith(syncMessage: 'Verifying signatures...');

    final db = ref.read(databaseProvider);
    await ref.read(cryptoServiceProvider.future); // Ensure crypto is initialized
    final crypto = ref.read(cryptoServiceProvider.notifier);

    final trustedSenders = await db.select(db.trustedSenders).get();
    final trustedKeys = trustedSenders.map((e) => e.publicKey).toList();

    final validMarkers = <HazardMarkersCompanion>[];
      for (final m in payload.markers) {
        final payloadToSign = utf8.encode('${m.id}${m.type}${m.timestamp}');
        final trustTier = await crypto.verifyAndGetTrustTier(
          data: payloadToSign,
          signatureStr: m.signature,
          senderPublicKeyStr: m.senderId,
          trustedPublicKeys: trustedKeys,
        );

        if (trustTier != 5) {
          validMarkers.add(HazardMarkersCompanion.insert(
            id: m.id,
            latitude: m.latitude,
            longitude: m.longitude,
            type: m.type,
            description: m.description,
            timestamp: m.timestamp.toInt(),
            senderId: m.senderId,
            signature: Value(m.signature),
            trustTier: trustTier,
          ));
        } else {
          print("Invalid signature for marker ${m.id}, dropping.");
        }
      }

    final validNews = <NewsItemsCompanion>[];
      for (final n in payload.news) {
        final payloadToSign = utf8.encode('${n.id}${n.title}${n.timestamp}');
        final trustTier = await crypto.verifyAndGetTrustTier(
          data: payloadToSign,
          signatureStr: n.signature,
          senderPublicKeyStr: n.senderId,
          trustedPublicKeys: trustedKeys,
        );

        if (trustTier != 5) {
          validNews.add(NewsItemsCompanion.insert(
            id: n.id,
            title: n.title,
            content: n.content,
            timestamp: n.timestamp.toInt(),
            senderId: n.senderId,
            signature: Value(n.signature),
            trustTier: trustTier,
          ));
        } else {
          print("Invalid signature for news ${n.id}, dropping.");
        }
      }
  
      state = state.copyWith(syncMessage: 'Saving to database...');
  
      await db.transaction(() async {
        for (final m in validMarkers) {
          await db.into(db.hazardMarkers).insert(m, mode: InsertMode.insertOrReplace);
        }
        for (final n in validNews) {
          await db.into(db.newsItems).insert(n, mode: InsertMode.insertOrReplace);
        }
    });

    state = state.copyWith(
      isSyncing: false, 
      syncMessage: 'Successfully synced ${validMarkers.length} markers and ${validNews.length} news items.'
    );
    print("Successfully synced ${payload.markers.length} markers and ${payload.news.length} news items.");
  }

  Future<void> triggerSync() async {
    await _sendManifest();
  }

  Future<void> broadcastText(String text) async {
    if (_host != null && state.hostState?.isActive == true) {
      await _host!.broadcastText(text);
    } else if (_client != null && state.clientState?.isActive == true) {
      await _client!.broadcastText(text);
    }
  }
}
