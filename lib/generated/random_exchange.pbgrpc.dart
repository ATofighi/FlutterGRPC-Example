///
//  Generated code. Do not modify.
//  source: random_exchange.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'random_exchange.pb.dart' as $0;
export 'random_exchange.pb.dart';

class RandomExchangerServiceClient extends $grpc.Client {
  static final _$getSingleRandom =
      $grpc.ClientMethod<$0.RandomRequest, $0.RandomResponse>(
          '/random_exchange.RandomExchangerService/GetSingleRandom',
          ($0.RandomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RandomResponse.fromBuffer(value));
  static final _$getRandomForEver =
      $grpc.ClientMethod<$0.RandomRequest, $0.RandomResponse>(
          '/random_exchange.RandomExchangerService/GetRandomForEver',
          ($0.RandomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RandomResponse.fromBuffer(value));
  static final _$getSingleRandomWithMultipleConditions = $grpc.ClientMethod<
          $0.RandomRequest, $0.RandomResponse>(
      '/random_exchange.RandomExchangerService/GetSingleRandomWithMultipleConditions',
      ($0.RandomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RandomResponse.fromBuffer(value));
  static final _$getBidiRandom =
      $grpc.ClientMethod<$0.RandomRequest, $0.RandomResponse>(
          '/random_exchange.RandomExchangerService/GetBidiRandom',
          ($0.RandomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RandomResponse.fromBuffer(value));

  RandomExchangerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RandomResponse> getSingleRandom(
      $0.RandomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSingleRandom, request, options: options);
  }

  $grpc.ResponseStream<$0.RandomResponse> getRandomForEver(
      $0.RandomRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getRandomForEver, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.RandomResponse> getSingleRandomWithMultipleConditions(
      $async.Stream<$0.RandomRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
            _$getSingleRandomWithMultipleConditions, request,
            options: options)
        .single;
  }

  $grpc.ResponseStream<$0.RandomResponse> getBidiRandom(
      $async.Stream<$0.RandomRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getBidiRandom, request, options: options);
  }
}

abstract class RandomExchangerServiceBase extends $grpc.Service {
  $core.String get $name => 'random_exchange.RandomExchangerService';

  RandomExchangerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RandomRequest, $0.RandomResponse>(
        'GetSingleRandom',
        getSingleRandom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RandomRequest.fromBuffer(value),
        ($0.RandomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RandomRequest, $0.RandomResponse>(
        'GetRandomForEver',
        getRandomForEver_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RandomRequest.fromBuffer(value),
        ($0.RandomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RandomRequest, $0.RandomResponse>(
        'GetSingleRandomWithMultipleConditions',
        getSingleRandomWithMultipleConditions,
        true,
        false,
        ($core.List<$core.int> value) => $0.RandomRequest.fromBuffer(value),
        ($0.RandomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RandomRequest, $0.RandomResponse>(
        'GetBidiRandom',
        getBidiRandom,
        true,
        true,
        ($core.List<$core.int> value) => $0.RandomRequest.fromBuffer(value),
        ($0.RandomResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RandomResponse> getSingleRandom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RandomRequest> request) async {
    return getSingleRandom(call, await request);
  }

  $async.Stream<$0.RandomResponse> getRandomForEver_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RandomRequest> request) async* {
    yield* getRandomForEver(call, await request);
  }

  $async.Future<$0.RandomResponse> getSingleRandom(
      $grpc.ServiceCall call, $0.RandomRequest request);
  $async.Stream<$0.RandomResponse> getRandomForEver(
      $grpc.ServiceCall call, $0.RandomRequest request);
  $async.Future<$0.RandomResponse> getSingleRandomWithMultipleConditions(
      $grpc.ServiceCall call, $async.Stream<$0.RandomRequest> request);
  $async.Stream<$0.RandomResponse> getBidiRandom(
      $grpc.ServiceCall call, $async.Stream<$0.RandomRequest> request);
}
