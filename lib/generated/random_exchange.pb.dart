///
//  Generated code. Do not modify.
//  source: random_exchange.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RandomRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RandomRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'random_exchange'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minimum', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximum', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RandomRequest._() : super();
  factory RandomRequest({
    $core.int? minimum,
    $core.int? maximum,
  }) {
    final _result = create();
    if (minimum != null) {
      _result.minimum = minimum;
    }
    if (maximum != null) {
      _result.maximum = maximum;
    }
    return _result;
  }
  factory RandomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RandomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RandomRequest clone() => RandomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RandomRequest copyWith(void Function(RandomRequest) updates) => super.copyWith((message) => updates(message as RandomRequest)) as RandomRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RandomRequest create() => RandomRequest._();
  RandomRequest createEmptyInstance() => create();
  static $pb.PbList<RandomRequest> createRepeated() => $pb.PbList<RandomRequest>();
  @$core.pragma('dart2js:noInline')
  static RandomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RandomRequest>(create);
  static RandomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minimum => $_getIZ(0);
  @$pb.TagNumber(1)
  set minimum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinimum() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinimum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maximum => $_getIZ(1);
  @$pb.TagNumber(2)
  set maximum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaximum() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaximum() => clearField(2);
}

class RandomResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RandomResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'random_exchange'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RandomResponse._() : super();
  factory RandomResponse({
    $core.int? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RandomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RandomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RandomResponse clone() => RandomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RandomResponse copyWith(void Function(RandomResponse) updates) => super.copyWith((message) => updates(message as RandomResponse)) as RandomResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RandomResponse create() => RandomResponse._();
  RandomResponse createEmptyInstance() => create();
  static $pb.PbList<RandomResponse> createRepeated() => $pb.PbList<RandomResponse>();
  @$core.pragma('dart2js:noInline')
  static RandomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RandomResponse>(create);
  static RandomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

