///
//  Generated code. Do not modify.
//  source: random_exchange.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use randomRequestDescriptor instead')
const RandomRequest$json = const {
  '1': 'RandomRequest',
  '2': const [
    const {'1': 'minimum', '3': 1, '4': 1, '5': 5, '10': 'minimum'},
    const {'1': 'maximum', '3': 2, '4': 1, '5': 5, '10': 'maximum'},
  ],
};

/// Descriptor for `RandomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List randomRequestDescriptor = $convert.base64Decode('Cg1SYW5kb21SZXF1ZXN0EhgKB21pbmltdW0YASABKAVSB21pbmltdW0SGAoHbWF4aW11bRgCIAEoBVIHbWF4aW11bQ==');
@$core.Deprecated('Use randomResponseDescriptor instead')
const RandomResponse$json = const {
  '1': 'RandomResponse',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `RandomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List randomResponseDescriptor = $convert.base64Decode('Cg5SYW5kb21SZXNwb25zZRIUCgV2YWx1ZRgBIAEoBVIFdmFsdWU=');
