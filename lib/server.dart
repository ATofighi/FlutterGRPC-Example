import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:flutter_app/generated/random_exchange.pb.dart';
import 'package:flutter_app/generated/random_exchange.pbgrpc.dart';

class RandomExchangerService extends RandomExchangerServiceBase {
  var randomGenerator = new Random();

  @override
  Future<RandomResponse> getSingleRandom(
      ServiceCall call, RandomRequest request) async {
    return RandomResponse()
      ..value = randomGenerator.nextInt(request.maximum - request.minimum + 1) +
          request.minimum;
  }

  @override
  Stream<RandomResponse> getBidiRandom(
      ServiceCall call, Stream<RandomRequest> requests) async* {
    await for(var request in requests) {
      yield RandomResponse()
        ..value =
            randomGenerator.nextInt(request.maximum - request.minimum + 1) +
                request.minimum;
      await Future.delayed(Duration(milliseconds: 250));
      yield RandomResponse()
        ..value =
            randomGenerator.nextInt(request.maximum - request.minimum + 1) +
                request.minimum;
      await Future.delayed(Duration(milliseconds: 250));
      yield RandomResponse()
        ..value =
            randomGenerator.nextInt(request.maximum - request.minimum + 1) +
                request.minimum;
    }
  }

  @override
  Future<RandomResponse> getSingleRandomWithMultipleConditions(
      ServiceCall call, Stream<RandomRequest> requests) async {
    var minimum = -1000000000;
    var maximum = 1000000000;
    await for (var request in requests) {
      minimum = max(request.minimum, minimum);
      maximum = min(request.maximum, maximum);
    }
    maximum = max(minimum, maximum);
    return RandomResponse()
      ..value = randomGenerator.nextInt(maximum - minimum + 1) + minimum;
  }

  @override
  Stream<RandomResponse> getRandomForEver(
      ServiceCall call, RandomRequest request) async* {
    while (!call.isCanceled && !call.isTimedOut) {
      yield RandomResponse()
        ..value =
            randomGenerator.nextInt(request.maximum - request.minimum + 1) +
                request.minimum;
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [RandomExchangerService()],
  );
  await server.serve(address: '0.0.0.0', port: 50051);
  print('Server listening on port ${server.port}...');
}
