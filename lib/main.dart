import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/tables.dart';
import 'providers/hazard_marker_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: FloodioApp()));
}

class FloodioApp extends ConsumerWidget {
  const FloodioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Floodio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markersAsync = ref.watch(hazardMarkersControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Floodio PoC'),
      ),
      body: switch (markersAsync) {
        AsyncData(:final value) => value.isEmpty
            ? const Center(child: Text('No hazard markers found.'))
            : ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final marker = value[index];
                  return ListTile(
                    leading: const Icon(Icons.warning, color: Colors.orange),
                    title: Text(marker.type),
                    subtitle: Text(marker.description),
                    trailing: Text('Tier: ${marker.trustTier}'),
                  );
                },
              ),
        AsyncError(:final error) => Center(child: Text('Error: $error')),
        _ => const Center(child: CircularProgressIndicator()),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newMarker = HazardMarkerEntity(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            latitude: 37.7749,
            longitude: -122.4194,
            type: 'Flood',
            description: 'Water level rising rapidly',
            timestamp: DateTime.now().millisecondsSinceEpoch,
            senderId: 'user_123',
            trustTier: 4,
          );
          ref.read(hazardMarkersControllerProvider.notifier).addMarker(newMarker);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
