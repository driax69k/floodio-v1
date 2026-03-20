import 'package:drift/drift.dart';

@DataClassName('HazardMarkerEntity')
class HazardMarkers extends Table {
  TextColumn get id => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get type => text()();
  TextColumn get description => text()();
  IntColumn get timestamp => integer()();
  TextColumn get senderId => text()();
  TextColumn get signature => text().nullable()();
  IntColumn get trustTier => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NewsItemEntity')
class NewsItems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  IntColumn get timestamp => integer()();
  TextColumn get senderId => text()();
  TextColumn get signature => text().nullable()();
  IntColumn get trustTier => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SyncPayloadEntity')
class SyncPayloads extends Table {
  TextColumn get id => text()();
  BlobColumn get payload => blob()();
  IntColumn get timestamp => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SeenMessageIdEntity')
class SeenMessageIds extends Table {
  TextColumn get messageId => text()();
  IntColumn get timestamp => integer()();

  @override
  Set<Column> get primaryKey => {messageId};
}
