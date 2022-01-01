///
//  Generated code. Do not modify.
//  source: grap.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grap.pb.dart' as $0;
export 'grap.pb.dart';

class GrapClient extends $grpc.Client {
  static final _$getUserInfo = $grpc.ClientMethod<$0.UserReq, $0.UserRes>(
      '/grap.Grap/GetUserInfo',
      ($0.UserReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserRes.fromBuffer(value));
  static final _$getManyTelUser =
      $grpc.ClientMethod<$0.ManyTelReq, $0.ManyUserRes>(
          '/grap.Grap/GetManyTelUser',
          ($0.ManyTelReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ManyUserRes.fromBuffer(value));
  static final _$getUserAndCode =
      $grpc.ClientMethod<$0.UserReq, $0.UserAndCodeRes>(
          '/grap.Grap/GetUserAndCode',
          ($0.UserReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UserAndCodeRes.fromBuffer(value));
  static final _$getUserWithCode = $grpc.ClientMethod<$0.CodeReq, $0.UserRes>(
      '/grap.Grap/GetUserWithCode',
      ($0.CodeReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserRes.fromBuffer(value));
  static final _$getUserCode = $grpc.ClientMethod<$0.UserReq, $0.CodeRes>(
      '/grap.Grap/GetUserCode',
      ($0.UserReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CodeRes.fromBuffer(value));

  GrapClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserRes> getUserInfo($0.UserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.ManyUserRes> getManyTelUser($0.ManyTelReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getManyTelUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserAndCodeRes> getUserAndCode($0.UserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserAndCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserRes> getUserWithCode($0.CodeReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserWithCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.CodeRes> getUserCode($0.UserReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserCode, request, options: options);
  }
}

abstract class GrapServiceBase extends $grpc.Service {
  $core.String get $name => 'grap.Grap';

  GrapServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserReq, $0.UserRes>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserReq.fromBuffer(value),
        ($0.UserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ManyTelReq, $0.ManyUserRes>(
        'GetManyTelUser',
        getManyTelUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ManyTelReq.fromBuffer(value),
        ($0.ManyUserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserReq, $0.UserAndCodeRes>(
        'GetUserAndCode',
        getUserAndCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserReq.fromBuffer(value),
        ($0.UserAndCodeRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CodeReq, $0.UserRes>(
        'GetUserWithCode',
        getUserWithCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CodeReq.fromBuffer(value),
        ($0.UserRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserReq, $0.CodeRes>(
        'GetUserCode',
        getUserCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserReq.fromBuffer(value),
        ($0.CodeRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserRes> getUserInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserReq> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.ManyUserRes> getManyTelUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ManyTelReq> request) async {
    return getManyTelUser(call, await request);
  }

  $async.Future<$0.UserAndCodeRes> getUserAndCode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserReq> request) async {
    return getUserAndCode(call, await request);
  }

  $async.Future<$0.UserRes> getUserWithCode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CodeReq> request) async {
    return getUserWithCode(call, await request);
  }

  $async.Future<$0.CodeRes> getUserCode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserReq> request) async {
    return getUserCode(call, await request);
  }

  $async.Future<$0.UserRes> getUserInfo(
      $grpc.ServiceCall call, $0.UserReq request);
  $async.Future<$0.ManyUserRes> getManyTelUser(
      $grpc.ServiceCall call, $0.ManyTelReq request);
  $async.Future<$0.UserAndCodeRes> getUserAndCode(
      $grpc.ServiceCall call, $0.UserReq request);
  $async.Future<$0.UserRes> getUserWithCode(
      $grpc.ServiceCall call, $0.CodeReq request);
  $async.Future<$0.CodeRes> getUserCode(
      $grpc.ServiceCall call, $0.UserReq request);
}
