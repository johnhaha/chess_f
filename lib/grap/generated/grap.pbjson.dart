///
//  Generated code. Do not modify.
//  source: grap.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use grapUserDescriptor instead')
const GrapUser$json = const {
  '1': 'GrapUser',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'avatar', '3': 2, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'des', '3': 4, '4': 1, '5': 9, '10': 'des'},
    const {'1': 'tel', '3': 5, '4': 1, '5': 9, '10': 'tel'},
    const {'1': 'online', '3': 6, '4': 1, '5': 8, '10': 'online'},
  ],
};

/// Descriptor for `GrapUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List grapUserDescriptor = $convert.base64Decode('CghHcmFwVXNlchIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIWCgZhdmF0YXIYAiABKAlSBmF2YXRhchISCgRuYW1lGAMgASgJUgRuYW1lEhAKA2RlcxgEIAEoCVIDZGVzEhAKA3RlbBgFIAEoCVIDdGVsEhYKBm9ubGluZRgGIAEoCFIGb25saW5l');
@$core.Deprecated('Use chatCodeDescriptor instead')
const ChatCode$json = const {
  '1': 'ChatCode',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'expireAt', '3': 2, '4': 1, '5': 9, '10': 'expireAt'},
  ],
};

/// Descriptor for `ChatCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCodeDescriptor = $convert.base64Decode('CghDaGF0Q29kZRISCgRjb2RlGAEgASgJUgRjb2RlEhoKCGV4cGlyZUF0GAIgASgJUghleHBpcmVBdA==');
@$core.Deprecated('Use userReqDescriptor instead')
const UserReq$json = const {
  '1': 'UserReq',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
  ],
};

/// Descriptor for `UserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userReqDescriptor = $convert.base64Decode('CgdVc2VyUmVxEhYKBnVzZXJJRBgBIAEoCVIGdXNlcklE');
@$core.Deprecated('Use telReqDescriptor instead')
const TelReq$json = const {
  '1': 'TelReq',
  '2': const [
    const {'1': 'tel', '3': 1, '4': 1, '5': 9, '10': 'tel'},
  ],
};

/// Descriptor for `TelReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List telReqDescriptor = $convert.base64Decode('CgZUZWxSZXESEAoDdGVsGAEgASgJUgN0ZWw=');
@$core.Deprecated('Use manyTelReqDescriptor instead')
const ManyTelReq$json = const {
  '1': 'ManyTelReq',
  '2': const [
    const {'1': 'tel', '3': 1, '4': 3, '5': 9, '10': 'tel'},
  ],
};

/// Descriptor for `ManyTelReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List manyTelReqDescriptor = $convert.base64Decode('CgpNYW55VGVsUmVxEhAKA3RlbBgBIAMoCVIDdGVs');
@$core.Deprecated('Use codeReqDescriptor instead')
const CodeReq$json = const {
  '1': 'CodeReq',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `CodeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codeReqDescriptor = $convert.base64Decode('CgdDb2RlUmVxEhIKBGNvZGUYASABKAlSBGNvZGU=');
@$core.Deprecated('Use userResDescriptor instead')
const UserRes$json = const {
  '1': 'UserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.grap.GrapUser', '10': 'user'},
  ],
};

/// Descriptor for `UserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResDescriptor = $convert.base64Decode('CgdVc2VyUmVzEiIKBHVzZXIYASABKAsyDi5ncmFwLkdyYXBVc2VyUgR1c2Vy');
@$core.Deprecated('Use manyUserResDescriptor instead')
const ManyUserRes$json = const {
  '1': 'ManyUserRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 3, '5': 11, '6': '.grap.GrapUser', '10': 'user'},
  ],
};

/// Descriptor for `ManyUserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List manyUserResDescriptor = $convert.base64Decode('CgtNYW55VXNlclJlcxIiCgR1c2VyGAEgAygLMg4uZ3JhcC5HcmFwVXNlclIEdXNlcg==');
@$core.Deprecated('Use userAndCodeResDescriptor instead')
const UserAndCodeRes$json = const {
  '1': 'UserAndCodeRes',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.grap.GrapUser', '10': 'user'},
    const {'1': 'code', '3': 2, '4': 1, '5': 11, '6': '.grap.ChatCode', '10': 'code'},
  ],
};

/// Descriptor for `UserAndCodeRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAndCodeResDescriptor = $convert.base64Decode('Cg5Vc2VyQW5kQ29kZVJlcxIiCgR1c2VyGAEgASgLMg4uZ3JhcC5HcmFwVXNlclIEdXNlchIiCgRjb2RlGAIgASgLMg4uZ3JhcC5DaGF0Q29kZVIEY29kZQ==');
@$core.Deprecated('Use codeResDescriptor instead')
const CodeRes$json = const {
  '1': 'CodeRes',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 11, '6': '.grap.ChatCode', '10': 'code'},
  ],
};

/// Descriptor for `CodeRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codeResDescriptor = $convert.base64Decode('CgdDb2RlUmVzEiIKBGNvZGUYASABKAsyDi5ncmFwLkNoYXRDb2RlUgRjb2Rl');
