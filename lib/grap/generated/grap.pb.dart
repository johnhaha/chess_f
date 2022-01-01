///
//  Generated code. Do not modify.
//  source: grap.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GrapUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GrapUser', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'des')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tel')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'online')
    ..hasRequiredFields = false
  ;

  GrapUser._() : super();
  factory GrapUser({
    $core.String? userID,
    $core.String? avatar,
    $core.String? name,
    $core.String? des,
    $core.String? tel,
    $core.bool? online,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (name != null) {
      _result.name = name;
    }
    if (des != null) {
      _result.des = des;
    }
    if (tel != null) {
      _result.tel = tel;
    }
    if (online != null) {
      _result.online = online;
    }
    return _result;
  }
  factory GrapUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GrapUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GrapUser clone() => GrapUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GrapUser copyWith(void Function(GrapUser) updates) => super.copyWith((message) => updates(message as GrapUser)) as GrapUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrapUser create() => GrapUser._();
  GrapUser createEmptyInstance() => create();
  static $pb.PbList<GrapUser> createRepeated() => $pb.PbList<GrapUser>();
  @$core.pragma('dart2js:noInline')
  static GrapUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GrapUser>(create);
  static GrapUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get des => $_getSZ(3);
  @$pb.TagNumber(4)
  set des($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDes() => $_has(3);
  @$pb.TagNumber(4)
  void clearDes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tel => $_getSZ(4);
  @$pb.TagNumber(5)
  set tel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTel() => $_has(4);
  @$pb.TagNumber(5)
  void clearTel() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get online => $_getBF(5);
  @$pb.TagNumber(6)
  set online($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOnline() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnline() => clearField(6);
}

class ChatCode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatCode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireAt', protoName: 'expireAt')
    ..hasRequiredFields = false
  ;

  ChatCode._() : super();
  factory ChatCode({
    $core.String? code,
    $core.String? expireAt,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (expireAt != null) {
      _result.expireAt = expireAt;
    }
    return _result;
  }
  factory ChatCode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCode clone() => ChatCode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCode copyWith(void Function(ChatCode) updates) => super.copyWith((message) => updates(message as ChatCode)) as ChatCode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatCode create() => ChatCode._();
  ChatCode createEmptyInstance() => create();
  static $pb.PbList<ChatCode> createRepeated() => $pb.PbList<ChatCode>();
  @$core.pragma('dart2js:noInline')
  static ChatCode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCode>(create);
  static ChatCode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get expireAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set expireAt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpireAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpireAt() => clearField(2);
}

class UserReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..hasRequiredFields = false
  ;

  UserReq._() : super();
  factory UserReq({
    $core.String? userID,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    return _result;
  }
  factory UserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserReq clone() => UserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserReq copyWith(void Function(UserReq) updates) => super.copyWith((message) => updates(message as UserReq)) as UserReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserReq create() => UserReq._();
  UserReq createEmptyInstance() => create();
  static $pb.PbList<UserReq> createRepeated() => $pb.PbList<UserReq>();
  @$core.pragma('dart2js:noInline')
  static UserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserReq>(create);
  static UserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}

class TelReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TelReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tel')
    ..hasRequiredFields = false
  ;

  TelReq._() : super();
  factory TelReq({
    $core.String? tel,
  }) {
    final _result = create();
    if (tel != null) {
      _result.tel = tel;
    }
    return _result;
  }
  factory TelReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TelReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TelReq clone() => TelReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TelReq copyWith(void Function(TelReq) updates) => super.copyWith((message) => updates(message as TelReq)) as TelReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TelReq create() => TelReq._();
  TelReq createEmptyInstance() => create();
  static $pb.PbList<TelReq> createRepeated() => $pb.PbList<TelReq>();
  @$core.pragma('dart2js:noInline')
  static TelReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TelReq>(create);
  static TelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tel => $_getSZ(0);
  @$pb.TagNumber(1)
  set tel($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTel() => $_has(0);
  @$pb.TagNumber(1)
  void clearTel() => clearField(1);
}

class ManyTelReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ManyTelReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tel')
    ..hasRequiredFields = false
  ;

  ManyTelReq._() : super();
  factory ManyTelReq({
    $core.Iterable<$core.String>? tel,
  }) {
    final _result = create();
    if (tel != null) {
      _result.tel.addAll(tel);
    }
    return _result;
  }
  factory ManyTelReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManyTelReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ManyTelReq clone() => ManyTelReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ManyTelReq copyWith(void Function(ManyTelReq) updates) => super.copyWith((message) => updates(message as ManyTelReq)) as ManyTelReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ManyTelReq create() => ManyTelReq._();
  ManyTelReq createEmptyInstance() => create();
  static $pb.PbList<ManyTelReq> createRepeated() => $pb.PbList<ManyTelReq>();
  @$core.pragma('dart2js:noInline')
  static ManyTelReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManyTelReq>(create);
  static ManyTelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get tel => $_getList(0);
}

class CodeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CodeReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  CodeReq._() : super();
  factory CodeReq({
    $core.String? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory CodeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CodeReq clone() => CodeReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CodeReq copyWith(void Function(CodeReq) updates) => super.copyWith((message) => updates(message as CodeReq)) as CodeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodeReq create() => CodeReq._();
  CodeReq createEmptyInstance() => create();
  static $pb.PbList<CodeReq> createRepeated() => $pb.PbList<CodeReq>();
  @$core.pragma('dart2js:noInline')
  static CodeReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeReq>(create);
  static CodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class UserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOM<GrapUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: GrapUser.create)
    ..hasRequiredFields = false
  ;

  UserRes._() : super();
  factory UserRes({
    GrapUser? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory UserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRes clone() => UserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRes copyWith(void Function(UserRes) updates) => super.copyWith((message) => updates(message as UserRes)) as UserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRes create() => UserRes._();
  UserRes createEmptyInstance() => create();
  static $pb.PbList<UserRes> createRepeated() => $pb.PbList<UserRes>();
  @$core.pragma('dart2js:noInline')
  static UserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRes>(create);
  static UserRes? _defaultInstance;

  @$pb.TagNumber(1)
  GrapUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(GrapUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  GrapUser ensureUser() => $_ensure(0);
}

class ManyUserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ManyUserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..pc<GrapUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', $pb.PbFieldType.PM, subBuilder: GrapUser.create)
    ..hasRequiredFields = false
  ;

  ManyUserRes._() : super();
  factory ManyUserRes({
    $core.Iterable<GrapUser>? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory ManyUserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManyUserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ManyUserRes clone() => ManyUserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ManyUserRes copyWith(void Function(ManyUserRes) updates) => super.copyWith((message) => updates(message as ManyUserRes)) as ManyUserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ManyUserRes create() => ManyUserRes._();
  ManyUserRes createEmptyInstance() => create();
  static $pb.PbList<ManyUserRes> createRepeated() => $pb.PbList<ManyUserRes>();
  @$core.pragma('dart2js:noInline')
  static ManyUserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManyUserRes>(create);
  static ManyUserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrapUser> get user => $_getList(0);
}

class UserAndCodeRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserAndCodeRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOM<GrapUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: GrapUser.create)
    ..aOM<ChatCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', subBuilder: ChatCode.create)
    ..hasRequiredFields = false
  ;

  UserAndCodeRes._() : super();
  factory UserAndCodeRes({
    GrapUser? user,
    ChatCode? code,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory UserAndCodeRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAndCodeRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAndCodeRes clone() => UserAndCodeRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAndCodeRes copyWith(void Function(UserAndCodeRes) updates) => super.copyWith((message) => updates(message as UserAndCodeRes)) as UserAndCodeRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAndCodeRes create() => UserAndCodeRes._();
  UserAndCodeRes createEmptyInstance() => create();
  static $pb.PbList<UserAndCodeRes> createRepeated() => $pb.PbList<UserAndCodeRes>();
  @$core.pragma('dart2js:noInline')
  static UserAndCodeRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAndCodeRes>(create);
  static UserAndCodeRes? _defaultInstance;

  @$pb.TagNumber(1)
  GrapUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(GrapUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  GrapUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  ChatCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(ChatCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
  @$pb.TagNumber(2)
  ChatCode ensureCode() => $_ensure(1);
}

class CodeRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CodeRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'grap'), createEmptyInstance: create)
    ..aOM<ChatCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', subBuilder: ChatCode.create)
    ..hasRequiredFields = false
  ;

  CodeRes._() : super();
  factory CodeRes({
    ChatCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory CodeRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CodeRes clone() => CodeRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CodeRes copyWith(void Function(CodeRes) updates) => super.copyWith((message) => updates(message as CodeRes)) as CodeRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodeRes create() => CodeRes._();
  CodeRes createEmptyInstance() => create();
  static $pb.PbList<CodeRes> createRepeated() => $pb.PbList<CodeRes>();
  @$core.pragma('dart2js:noInline')
  static CodeRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeRes>(create);
  static CodeRes? _defaultInstance;

  @$pb.TagNumber(1)
  ChatCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(ChatCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
  @$pb.TagNumber(1)
  ChatCode ensureCode() => $_ensure(0);
}

