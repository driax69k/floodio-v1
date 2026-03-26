import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:fixnum/fixnum.dart' as $fixnum;

class HazardMarker extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HazardMarker', package: const $pb.PackageName('floodio'), createEmptyInstance: () => HazardMarker())
    ..aOS(1, 'id')
    ..a<$core.double>(2, 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, 'longitude', $pb.PbFieldType.OD)
    ..aOS(4, 'type')
    ..aOS(5, 'description')
    ..aInt64(6, 'timestamp')
    ..aOS(7, 'senderId')
    ..aOS(8, 'signature')
    ..a<$core.int>(9, 'trustTier', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HazardMarker._() : super();
  factory HazardMarker({
    $core.String? id,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? type,
    $core.String? description,
    $fixnum.Int64? timestamp,
    $core.String? senderId,
    $core.String? signature,
    $core.int? trustTier,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    if (type != null) result.type = type;
    if (description != null) result.description = description;
    if (timestamp != null) result.timestamp = timestamp;
    if (senderId != null) result.senderId = senderId;
    if (signature != null) result.signature = signature;
    if (trustTier != null) result.trustTier = trustTier;
    return result;
  }
  factory HazardMarker.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HazardMarker.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  static HazardMarker create() => HazardMarker._();
  @$core.override
  HazardMarker createEmptyInstance() => create();
  @$core.override
  HazardMarker clone() => HazardMarker()..mergeFromMessage(this);
  @$core.override
  $pb.BuilderInfo get info_ => _i;

  $core.String get id => $_getSZ(0);
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.double get latitude => $_getN(1);
  set latitude($core.double v) { $_setDouble(1, v); }
  $core.bool hasLatitude() => $_has(1);
  void clearLatitude() => clearField(2);

  $core.double get longitude => $_getN(2);
  set longitude($core.double v) { $_setDouble(2, v); }
  $core.bool hasLongitude() => $_has(2);
  void clearLongitude() => clearField(3);

  $core.String get type => $_getSZ(3);
  set type($core.String v) { $_setString(3, v); }
  $core.bool hasType() => $_has(3);
  void clearType() => clearField(4);

  $core.String get description => $_getSZ(4);
  set description($core.String v) { $_setString(4, v); }
  $core.bool hasDescription() => $_has(4);
  void clearDescription() => clearField(5);

  $fixnum.Int64 get timestamp => $_getI64(5);
  set timestamp($fixnum.Int64 v) { $_setInt64(5, v); }
  $core.bool hasTimestamp() => $_has(5);
  void clearTimestamp() => clearField(6);

  $core.String get senderId => $_getSZ(6);
  set senderId($core.String v) { $_setString(6, v); }
  $core.bool hasSenderId() => $_has(6);
  void clearSenderId() => clearField(7);

  $core.String get signature => $_getSZ(7);
  set signature($core.String v) { $_setString(7, v); }
  $core.bool hasSignature() => $_has(7);
  void clearSignature() => clearField(8);

  $core.int get trustTier => $_getIZ(8);
  set trustTier($core.int v) { $_setSignedInt32(8, v); }
  $core.bool hasTrustTier() => $_has(8);
  void clearTrustTier() => clearField(9);
}

class NewsItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewsItem', package: const $pb.PackageName('floodio'), createEmptyInstance: () => NewsItem())
    ..aOS(1, 'id')
    ..aOS(2, 'title')
    ..aOS(3, 'content')
    ..aInt64(4, 'timestamp')
    ..aOS(5, 'senderId')
    ..aOS(6, 'signature')
    ..a<$core.int>(7, 'trustTier', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  NewsItem._() : super();
  factory NewsItem({
    $core.String? id,
    $core.String? title,
    $core.String? content,
    $fixnum.Int64? timestamp,
    $core.String? senderId,
    $core.String? signature,
    $core.int? trustTier,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (timestamp != null) result.timestamp = timestamp;
    if (senderId != null) result.senderId = senderId;
    if (signature != null) result.signature = signature;
    if (trustTier != null) result.trustTier = trustTier;
    return result;
  }
  factory NewsItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  static NewsItem create() => NewsItem._();
  @$core.override
  NewsItem createEmptyInstance() => create();
  @$core.override
  NewsItem clone() => NewsItem()..mergeFromMessage(this);
  @$core.override
  $pb.BuilderInfo get info_ => _i;

  $core.String get id => $_getSZ(0);
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get title => $_getSZ(1);
  set title($core.String v) { $_setString(1, v); }
  $core.bool hasTitle() => $_has(1);
  void clearTitle() => clearField(2);

  $core.String get content => $_getSZ(2);
  set content($core.String v) { $_setString(2, v); }
  $core.bool hasContent() => $_has(2);
  void clearContent() => clearField(3);

  $fixnum.Int64 get timestamp => $_getI64(3);
  set timestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  $core.bool hasTimestamp() => $_has(3);
  void clearTimestamp() => clearField(4);

  $core.String get senderId => $_getSZ(4);
  set senderId($core.String v) { $_setString(4, v); }
  $core.bool hasSenderId() => $_has(4);
  void clearSenderId() => clearField(5);

  $core.String get signature => $_getSZ(5);
  set signature($core.String v) { $_setString(5, v); }
  $core.bool hasSignature() => $_has(5);
  void clearSignature() => clearField(6);

  $core.int get trustTier => $_getIZ(6);
  set trustTier($core.int v) { $_setSignedInt32(6, v); }
  $core.bool hasTrustTier() => $_has(6);
  void clearTrustTier() => clearField(7);
}

class SyncPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SyncPayload', package: const $pb.PackageName('floodio'), createEmptyInstance: () => SyncPayload())
    ..pc<HazardMarker>(1, 'markers', $pb.PbFieldType.PM, subBuilder: HazardMarker.create)
    ..pc<NewsItem>(2, 'news', $pb.PbFieldType.PM, subBuilder: NewsItem.create)
    ..hasRequiredFields = false;

  SyncPayload._() : super();
  factory SyncPayload({
    $core.Iterable<HazardMarker>? markers,
    $core.Iterable<NewsItem>? news,
  }) {
    final result = create();
    if (markers != null) {
      result.markers.addAll(markers);
    }
    if (news != null) {
      result.news.addAll(news);
    }
    return result;
  }
  factory SyncPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  static SyncPayload create() => SyncPayload._();
  @$core.override
  SyncPayload createEmptyInstance() => create();
  @$core.override
  SyncPayload clone() => SyncPayload()..mergeFromMessage(this);
  @$core.override
  $pb.BuilderInfo get info_ => _i;

  $core.List<HazardMarker> get markers => $_getList(0);
  $core.List<NewsItem> get news => $_getList(1);
}
