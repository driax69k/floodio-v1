// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HazardMarkersTable extends HazardMarkers
    with TableInfo<$HazardMarkersTable, HazardMarkerEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HazardMarkersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderIdMeta = const VerificationMeta(
    'senderId',
  );
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
    'sender_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trustTierMeta = const VerificationMeta(
    'trustTier',
  );
  @override
  late final GeneratedColumn<int> trustTier = GeneratedColumn<int>(
    'trust_tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    latitude,
    longitude,
    type,
    description,
    timestamp,
    senderId,
    signature,
    trustTier,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hazard_markers';
  @override
  VerificationContext validateIntegrity(
    Insertable<HazardMarkerEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(
        _senderIdMeta,
        senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('trust_tier')) {
      context.handle(
        _trustTierMeta,
        trustTier.isAcceptableOrUnknown(data['trust_tier']!, _trustTierMeta),
      );
    } else if (isInserting) {
      context.missing(_trustTierMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HazardMarkerEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HazardMarkerEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      senderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_id'],
      )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      ),
      trustTier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trust_tier'],
      )!,
    );
  }

  @override
  $HazardMarkersTable createAlias(String alias) {
    return $HazardMarkersTable(attachedDatabase, alias);
  }
}

class HazardMarkersCompanion extends UpdateCompanion<HazardMarkerEntity> {
  final Value<String> id;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> type;
  final Value<String> description;
  final Value<int> timestamp;
  final Value<String> senderId;
  final Value<String?> signature;
  final Value<int> trustTier;
  final Value<int> rowid;
  const HazardMarkersCompanion({
    this.id = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.senderId = const Value.absent(),
    this.signature = const Value.absent(),
    this.trustTier = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HazardMarkersCompanion.insert({
    required String id,
    required double latitude,
    required double longitude,
    required String type,
    required String description,
    required int timestamp,
    required String senderId,
    this.signature = const Value.absent(),
    required int trustTier,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       latitude = Value(latitude),
       longitude = Value(longitude),
       type = Value(type),
       description = Value(description),
       timestamp = Value(timestamp),
       senderId = Value(senderId),
       trustTier = Value(trustTier);
  static Insertable<HazardMarkerEntity> custom({
    Expression<String>? id,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? type,
    Expression<String>? description,
    Expression<int>? timestamp,
    Expression<String>? senderId,
    Expression<String>? signature,
    Expression<int>? trustTier,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
      if (senderId != null) 'sender_id': senderId,
      if (signature != null) 'signature': signature,
      if (trustTier != null) 'trust_tier': trustTier,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HazardMarkersCompanion copyWith({
    Value<String>? id,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? type,
    Value<String>? description,
    Value<int>? timestamp,
    Value<String>? senderId,
    Value<String?>? signature,
    Value<int>? trustTier,
    Value<int>? rowid,
  }) {
    return HazardMarkersCompanion(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      type: type ?? this.type,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      senderId: senderId ?? this.senderId,
      signature: signature ?? this.signature,
      trustTier: trustTier ?? this.trustTier,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (trustTier.present) {
      map['trust_tier'] = Variable<int>(trustTier.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HazardMarkersCompanion(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp, ')
          ..write('senderId: $senderId, ')
          ..write('signature: $signature, ')
          ..write('trustTier: $trustTier, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsItemsTable extends NewsItems
    with TableInfo<$NewsItemsTable, NewsItemEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderIdMeta = const VerificationMeta(
    'senderId',
  );
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
    'sender_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trustTierMeta = const VerificationMeta(
    'trustTier',
  );
  @override
  late final GeneratedColumn<int> trustTier = GeneratedColumn<int>(
    'trust_tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    timestamp,
    senderId,
    signature,
    trustTier,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<NewsItemEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(
        _senderIdMeta,
        senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('trust_tier')) {
      context.handle(
        _trustTierMeta,
        trustTier.isAcceptableOrUnknown(data['trust_tier']!, _trustTierMeta),
      );
    } else if (isInserting) {
      context.missing(_trustTierMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsItemEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsItemEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      senderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_id'],
      )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      ),
      trustTier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trust_tier'],
      )!,
    );
  }

  @override
  $NewsItemsTable createAlias(String alias) {
    return $NewsItemsTable(attachedDatabase, alias);
  }
}

class NewsItemsCompanion extends UpdateCompanion<NewsItemEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int> timestamp;
  final Value<String> senderId;
  final Value<String?> signature;
  final Value<int> trustTier;
  final Value<int> rowid;
  const NewsItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.senderId = const Value.absent(),
    this.signature = const Value.absent(),
    this.trustTier = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsItemsCompanion.insert({
    required String id,
    required String title,
    required String content,
    required int timestamp,
    required String senderId,
    this.signature = const Value.absent(),
    required int trustTier,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       content = Value(content),
       timestamp = Value(timestamp),
       senderId = Value(senderId),
       trustTier = Value(trustTier);
  static Insertable<NewsItemEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? timestamp,
    Expression<String>? senderId,
    Expression<String>? signature,
    Expression<int>? trustTier,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
      if (senderId != null) 'sender_id': senderId,
      if (signature != null) 'signature': signature,
      if (trustTier != null) 'trust_tier': trustTier,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? content,
    Value<int>? timestamp,
    Value<String>? senderId,
    Value<String?>? signature,
    Value<int>? trustTier,
    Value<int>? rowid,
  }) {
    return NewsItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      senderId: senderId ?? this.senderId,
      signature: signature ?? this.signature,
      trustTier: trustTier ?? this.trustTier,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (trustTier.present) {
      map['trust_tier'] = Variable<int>(trustTier.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp, ')
          ..write('senderId: $senderId, ')
          ..write('signature: $signature, ')
          ..write('trustTier: $trustTier, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncPayloadsTable extends SyncPayloads
    with TableInfo<$SyncPayloadsTable, SyncPayloadEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncPayloadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<Uint8List> payload = GeneratedColumn<Uint8List>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, payload, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_payloads';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncPayloadEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncPayloadEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncPayloadEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}payload'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $SyncPayloadsTable createAlias(String alias) {
    return $SyncPayloadsTable(attachedDatabase, alias);
  }
}

class SyncPayloadsCompanion extends UpdateCompanion<SyncPayloadEntity> {
  final Value<String> id;
  final Value<Uint8List> payload;
  final Value<int> timestamp;
  final Value<int> rowid;
  const SyncPayloadsCompanion({
    this.id = const Value.absent(),
    this.payload = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncPayloadsCompanion.insert({
    required String id,
    required Uint8List payload,
    required int timestamp,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       payload = Value(payload),
       timestamp = Value(timestamp);
  static Insertable<SyncPayloadEntity> custom({
    Expression<String>? id,
    Expression<Uint8List>? payload,
    Expression<int>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payload != null) 'payload': payload,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncPayloadsCompanion copyWith({
    Value<String>? id,
    Value<Uint8List>? payload,
    Value<int>? timestamp,
    Value<int>? rowid,
  }) {
    return SyncPayloadsCompanion(
      id: id ?? this.id,
      payload: payload ?? this.payload,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (payload.present) {
      map['payload'] = Variable<Uint8List>(payload.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncPayloadsCompanion(')
          ..write('id: $id, ')
          ..write('payload: $payload, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeenMessageIdsTable extends SeenMessageIds
    with TableInfo<$SeenMessageIdsTable, SeenMessageIdEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeenMessageIdsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [messageId, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seen_message_ids';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeenMessageIdEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId};
  @override
  SeenMessageIdEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeenMessageIdEntity(
      messageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $SeenMessageIdsTable createAlias(String alias) {
    return $SeenMessageIdsTable(attachedDatabase, alias);
  }
}

class SeenMessageIdsCompanion extends UpdateCompanion<SeenMessageIdEntity> {
  final Value<String> messageId;
  final Value<int> timestamp;
  final Value<int> rowid;
  const SeenMessageIdsCompanion({
    this.messageId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeenMessageIdsCompanion.insert({
    required String messageId,
    required int timestamp,
    this.rowid = const Value.absent(),
  }) : messageId = Value(messageId),
       timestamp = Value(timestamp);
  static Insertable<SeenMessageIdEntity> custom({
    Expression<String>? messageId,
    Expression<int>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeenMessageIdsCompanion copyWith({
    Value<String>? messageId,
    Value<int>? timestamp,
    Value<int>? rowid,
  }) {
    return SeenMessageIdsCompanion(
      messageId: messageId ?? this.messageId,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeenMessageIdsCompanion(')
          ..write('messageId: $messageId, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrustedSendersTable extends TrustedSenders
    with TableInfo<$TrustedSendersTable, TrustedSenderEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrustedSendersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _publicKeyMeta = const VerificationMeta(
    'publicKey',
  );
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
    'public_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [publicKey, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trusted_senders';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrustedSenderEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('public_key')) {
      context.handle(
        _publicKeyMeta,
        publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_publicKeyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {publicKey};
  @override
  TrustedSenderEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrustedSenderEntity(
      publicKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $TrustedSendersTable createAlias(String alias) {
    return $TrustedSendersTable(attachedDatabase, alias);
  }
}

class TrustedSendersCompanion extends UpdateCompanion<TrustedSenderEntity> {
  final Value<String> publicKey;
  final Value<String> name;
  final Value<int> rowid;
  const TrustedSendersCompanion({
    this.publicKey = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrustedSendersCompanion.insert({
    required String publicKey,
    required String name,
    this.rowid = const Value.absent(),
  }) : publicKey = Value(publicKey),
       name = Value(name);
  static Insertable<TrustedSenderEntity> custom({
    Expression<String>? publicKey,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (publicKey != null) 'public_key': publicKey,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrustedSendersCompanion copyWith({
    Value<String>? publicKey,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TrustedSendersCompanion(
      publicKey: publicKey ?? this.publicKey,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrustedSendersCompanion(')
          ..write('publicKey: $publicKey, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HazardMarkersTable hazardMarkers = $HazardMarkersTable(this);
  late final $NewsItemsTable newsItems = $NewsItemsTable(this);
  late final $SyncPayloadsTable syncPayloads = $SyncPayloadsTable(this);
  late final $SeenMessageIdsTable seenMessageIds = $SeenMessageIdsTable(this);
  late final $TrustedSendersTable trustedSenders = $TrustedSendersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    hazardMarkers,
    newsItems,
    syncPayloads,
    seenMessageIds,
    trustedSenders,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$HazardMarkersTableCreateCompanionBuilder =
    HazardMarkersCompanion Function({
      required String id,
      required double latitude,
      required double longitude,
      required String type,
      required String description,
      required int timestamp,
      required String senderId,
      Value<String?> signature,
      required int trustTier,
      Value<int> rowid,
    });
typedef $$HazardMarkersTableUpdateCompanionBuilder =
    HazardMarkersCompanion Function({
      Value<String> id,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> type,
      Value<String> description,
      Value<int> timestamp,
      Value<String> senderId,
      Value<String?> signature,
      Value<int> trustTier,
      Value<int> rowid,
    });

class $$HazardMarkersTableFilterComposer
    extends Composer<_$AppDatabase, $HazardMarkersTable> {
  $$HazardMarkersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trustTier => $composableBuilder(
    column: $table.trustTier,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HazardMarkersTableOrderingComposer
    extends Composer<_$AppDatabase, $HazardMarkersTable> {
  $$HazardMarkersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trustTier => $composableBuilder(
    column: $table.trustTier,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HazardMarkersTableAnnotationComposer
    extends Composer<_$AppDatabase, $HazardMarkersTable> {
  $$HazardMarkersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<int> get trustTier =>
      $composableBuilder(column: $table.trustTier, builder: (column) => column);
}

class $$HazardMarkersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HazardMarkersTable,
          HazardMarkerEntity,
          $$HazardMarkersTableFilterComposer,
          $$HazardMarkersTableOrderingComposer,
          $$HazardMarkersTableAnnotationComposer,
          $$HazardMarkersTableCreateCompanionBuilder,
          $$HazardMarkersTableUpdateCompanionBuilder,
          (
            HazardMarkerEntity,
            BaseReferences<
              _$AppDatabase,
              $HazardMarkersTable,
              HazardMarkerEntity
            >,
          ),
          HazardMarkerEntity,
          PrefetchHooks Function()
        > {
  $$HazardMarkersTableTableManager(_$AppDatabase db, $HazardMarkersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HazardMarkersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HazardMarkersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HazardMarkersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String> senderId = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                Value<int> trustTier = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HazardMarkersCompanion(
                id: id,
                latitude: latitude,
                longitude: longitude,
                type: type,
                description: description,
                timestamp: timestamp,
                senderId: senderId,
                signature: signature,
                trustTier: trustTier,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double latitude,
                required double longitude,
                required String type,
                required String description,
                required int timestamp,
                required String senderId,
                Value<String?> signature = const Value.absent(),
                required int trustTier,
                Value<int> rowid = const Value.absent(),
              }) => HazardMarkersCompanion.insert(
                id: id,
                latitude: latitude,
                longitude: longitude,
                type: type,
                description: description,
                timestamp: timestamp,
                senderId: senderId,
                signature: signature,
                trustTier: trustTier,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HazardMarkersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HazardMarkersTable,
      HazardMarkerEntity,
      $$HazardMarkersTableFilterComposer,
      $$HazardMarkersTableOrderingComposer,
      $$HazardMarkersTableAnnotationComposer,
      $$HazardMarkersTableCreateCompanionBuilder,
      $$HazardMarkersTableUpdateCompanionBuilder,
      (
        HazardMarkerEntity,
        BaseReferences<_$AppDatabase, $HazardMarkersTable, HazardMarkerEntity>,
      ),
      HazardMarkerEntity,
      PrefetchHooks Function()
    >;
typedef $$NewsItemsTableCreateCompanionBuilder =
    NewsItemsCompanion Function({
      required String id,
      required String title,
      required String content,
      required int timestamp,
      required String senderId,
      Value<String?> signature,
      required int trustTier,
      Value<int> rowid,
    });
typedef $$NewsItemsTableUpdateCompanionBuilder =
    NewsItemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> content,
      Value<int> timestamp,
      Value<String> senderId,
      Value<String?> signature,
      Value<int> trustTier,
      Value<int> rowid,
    });

class $$NewsItemsTableFilterComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trustTier => $composableBuilder(
    column: $table.trustTier,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NewsItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trustTier => $composableBuilder(
    column: $table.trustTier,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NewsItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<int> get trustTier =>
      $composableBuilder(column: $table.trustTier, builder: (column) => column);
}

class $$NewsItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NewsItemsTable,
          NewsItemEntity,
          $$NewsItemsTableFilterComposer,
          $$NewsItemsTableOrderingComposer,
          $$NewsItemsTableAnnotationComposer,
          $$NewsItemsTableCreateCompanionBuilder,
          $$NewsItemsTableUpdateCompanionBuilder,
          (
            NewsItemEntity,
            BaseReferences<_$AppDatabase, $NewsItemsTable, NewsItemEntity>,
          ),
          NewsItemEntity,
          PrefetchHooks Function()
        > {
  $$NewsItemsTableTableManager(_$AppDatabase db, $NewsItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String> senderId = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                Value<int> trustTier = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsItemsCompanion(
                id: id,
                title: title,
                content: content,
                timestamp: timestamp,
                senderId: senderId,
                signature: signature,
                trustTier: trustTier,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String content,
                required int timestamp,
                required String senderId,
                Value<String?> signature = const Value.absent(),
                required int trustTier,
                Value<int> rowid = const Value.absent(),
              }) => NewsItemsCompanion.insert(
                id: id,
                title: title,
                content: content,
                timestamp: timestamp,
                senderId: senderId,
                signature: signature,
                trustTier: trustTier,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NewsItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NewsItemsTable,
      NewsItemEntity,
      $$NewsItemsTableFilterComposer,
      $$NewsItemsTableOrderingComposer,
      $$NewsItemsTableAnnotationComposer,
      $$NewsItemsTableCreateCompanionBuilder,
      $$NewsItemsTableUpdateCompanionBuilder,
      (
        NewsItemEntity,
        BaseReferences<_$AppDatabase, $NewsItemsTable, NewsItemEntity>,
      ),
      NewsItemEntity,
      PrefetchHooks Function()
    >;
typedef $$SyncPayloadsTableCreateCompanionBuilder =
    SyncPayloadsCompanion Function({
      required String id,
      required Uint8List payload,
      required int timestamp,
      Value<int> rowid,
    });
typedef $$SyncPayloadsTableUpdateCompanionBuilder =
    SyncPayloadsCompanion Function({
      Value<String> id,
      Value<Uint8List> payload,
      Value<int> timestamp,
      Value<int> rowid,
    });

class $$SyncPayloadsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncPayloadsTable> {
  $$SyncPayloadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncPayloadsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncPayloadsTable> {
  $$SyncPayloadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncPayloadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncPayloadsTable> {
  $$SyncPayloadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<Uint8List> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$SyncPayloadsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncPayloadsTable,
          SyncPayloadEntity,
          $$SyncPayloadsTableFilterComposer,
          $$SyncPayloadsTableOrderingComposer,
          $$SyncPayloadsTableAnnotationComposer,
          $$SyncPayloadsTableCreateCompanionBuilder,
          $$SyncPayloadsTableUpdateCompanionBuilder,
          (
            SyncPayloadEntity,
            BaseReferences<
              _$AppDatabase,
              $SyncPayloadsTable,
              SyncPayloadEntity
            >,
          ),
          SyncPayloadEntity,
          PrefetchHooks Function()
        > {
  $$SyncPayloadsTableTableManager(_$AppDatabase db, $SyncPayloadsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncPayloadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncPayloadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncPayloadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Uint8List> payload = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncPayloadsCompanion(
                id: id,
                payload: payload,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required Uint8List payload,
                required int timestamp,
                Value<int> rowid = const Value.absent(),
              }) => SyncPayloadsCompanion.insert(
                id: id,
                payload: payload,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncPayloadsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncPayloadsTable,
      SyncPayloadEntity,
      $$SyncPayloadsTableFilterComposer,
      $$SyncPayloadsTableOrderingComposer,
      $$SyncPayloadsTableAnnotationComposer,
      $$SyncPayloadsTableCreateCompanionBuilder,
      $$SyncPayloadsTableUpdateCompanionBuilder,
      (
        SyncPayloadEntity,
        BaseReferences<_$AppDatabase, $SyncPayloadsTable, SyncPayloadEntity>,
      ),
      SyncPayloadEntity,
      PrefetchHooks Function()
    >;
typedef $$SeenMessageIdsTableCreateCompanionBuilder =
    SeenMessageIdsCompanion Function({
      required String messageId,
      required int timestamp,
      Value<int> rowid,
    });
typedef $$SeenMessageIdsTableUpdateCompanionBuilder =
    SeenMessageIdsCompanion Function({
      Value<String> messageId,
      Value<int> timestamp,
      Value<int> rowid,
    });

class $$SeenMessageIdsTableFilterComposer
    extends Composer<_$AppDatabase, $SeenMessageIdsTable> {
  $$SeenMessageIdsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SeenMessageIdsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeenMessageIdsTable> {
  $$SeenMessageIdsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeenMessageIdsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeenMessageIdsTable> {
  $$SeenMessageIdsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$SeenMessageIdsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeenMessageIdsTable,
          SeenMessageIdEntity,
          $$SeenMessageIdsTableFilterComposer,
          $$SeenMessageIdsTableOrderingComposer,
          $$SeenMessageIdsTableAnnotationComposer,
          $$SeenMessageIdsTableCreateCompanionBuilder,
          $$SeenMessageIdsTableUpdateCompanionBuilder,
          (
            SeenMessageIdEntity,
            BaseReferences<
              _$AppDatabase,
              $SeenMessageIdsTable,
              SeenMessageIdEntity
            >,
          ),
          SeenMessageIdEntity,
          PrefetchHooks Function()
        > {
  $$SeenMessageIdsTableTableManager(
    _$AppDatabase db,
    $SeenMessageIdsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeenMessageIdsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeenMessageIdsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeenMessageIdsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> messageId = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeenMessageIdsCompanion(
                messageId: messageId,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String messageId,
                required int timestamp,
                Value<int> rowid = const Value.absent(),
              }) => SeenMessageIdsCompanion.insert(
                messageId: messageId,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SeenMessageIdsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeenMessageIdsTable,
      SeenMessageIdEntity,
      $$SeenMessageIdsTableFilterComposer,
      $$SeenMessageIdsTableOrderingComposer,
      $$SeenMessageIdsTableAnnotationComposer,
      $$SeenMessageIdsTableCreateCompanionBuilder,
      $$SeenMessageIdsTableUpdateCompanionBuilder,
      (
        SeenMessageIdEntity,
        BaseReferences<
          _$AppDatabase,
          $SeenMessageIdsTable,
          SeenMessageIdEntity
        >,
      ),
      SeenMessageIdEntity,
      PrefetchHooks Function()
    >;
typedef $$TrustedSendersTableCreateCompanionBuilder =
    TrustedSendersCompanion Function({
      required String publicKey,
      required String name,
      Value<int> rowid,
    });
typedef $$TrustedSendersTableUpdateCompanionBuilder =
    TrustedSendersCompanion Function({
      Value<String> publicKey,
      Value<String> name,
      Value<int> rowid,
    });

class $$TrustedSendersTableFilterComposer
    extends Composer<_$AppDatabase, $TrustedSendersTable> {
  $$TrustedSendersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrustedSendersTableOrderingComposer
    extends Composer<_$AppDatabase, $TrustedSendersTable> {
  $$TrustedSendersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrustedSendersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrustedSendersTable> {
  $$TrustedSendersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get publicKey =>
      $composableBuilder(column: $table.publicKey, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$TrustedSendersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrustedSendersTable,
          TrustedSenderEntity,
          $$TrustedSendersTableFilterComposer,
          $$TrustedSendersTableOrderingComposer,
          $$TrustedSendersTableAnnotationComposer,
          $$TrustedSendersTableCreateCompanionBuilder,
          $$TrustedSendersTableUpdateCompanionBuilder,
          (
            TrustedSenderEntity,
            BaseReferences<
              _$AppDatabase,
              $TrustedSendersTable,
              TrustedSenderEntity
            >,
          ),
          TrustedSenderEntity,
          PrefetchHooks Function()
        > {
  $$TrustedSendersTableTableManager(
    _$AppDatabase db,
    $TrustedSendersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrustedSendersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrustedSendersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrustedSendersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> publicKey = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrustedSendersCompanion(
                publicKey: publicKey,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String publicKey,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TrustedSendersCompanion.insert(
                publicKey: publicKey,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrustedSendersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrustedSendersTable,
      TrustedSenderEntity,
      $$TrustedSendersTableFilterComposer,
      $$TrustedSendersTableOrderingComposer,
      $$TrustedSendersTableAnnotationComposer,
      $$TrustedSendersTableCreateCompanionBuilder,
      $$TrustedSendersTableUpdateCompanionBuilder,
      (
        TrustedSenderEntity,
        BaseReferences<
          _$AppDatabase,
          $TrustedSendersTable,
          TrustedSenderEntity
        >,
      ),
      TrustedSenderEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HazardMarkersTableTableManager get hazardMarkers =>
      $$HazardMarkersTableTableManager(_db, _db.hazardMarkers);
  $$NewsItemsTableTableManager get newsItems =>
      $$NewsItemsTableTableManager(_db, _db.newsItems);
  $$SyncPayloadsTableTableManager get syncPayloads =>
      $$SyncPayloadsTableTableManager(_db, _db.syncPayloads);
  $$SeenMessageIdsTableTableManager get seenMessageIds =>
      $$SeenMessageIdsTableTableManager(_db, _db.seenMessageIds);
  $$TrustedSendersTableTableManager get trustedSenders =>
      $$TrustedSendersTableTableManager(_db, _db.trustedSenders);
}
