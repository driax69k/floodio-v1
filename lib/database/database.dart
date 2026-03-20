import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [HazardMarkers, NewsItems, SyncPayloads, SeenMessageIds])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'floodio_db'));

  @override
  int get schemaVersion => 1;
}
