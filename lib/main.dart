import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/random_exchange.pbgrpc.dart';
import 'package:grpc/grpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter GRPC Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 0;
  int? _minimum = 0;
  int? _maximum = 10000;
  late RandomExchangerServiceClient stub;
  TextEditingController _minimumFieldController = TextEditingController();
  TextEditingController _maximumFieldController = TextEditingController();
  ResponseStream? _responseStream;
  bool _streamValues = false;

  void _getSingleRandom() async {
    final response = await stub
        .getSingleRandom(RandomRequest(minimum: _minimum, maximum: _maximum));
    setState(() {
      _value = response.value;
    });
  }

  void _getRandomsForEver() async {
    final responseStream = stub
        .getRandomForEver(RandomRequest(minimum: _minimum, maximum: _maximum));
    setState(() {
      _responseStream = responseStream;
    });
    await for (var response in responseStream) {
      setState(() {
        _value = response.value;
      });
    }
  }

  void _getMultiConditionRandom() async {
    Stream<RandomRequest> requestBounds() async* {
      var finished = false;
      while (!finished) {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text("Enter bound in next 10 seconds"),
                    actions: [
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Text('OK And Continue')),
                      TextButton(
                          onPressed: () =>
                              {finished = true, Navigator.pop(context)},
                          child: Text('It is last')),
                    ]));
        await Future.delayed(Duration(seconds: 10));
        yield RandomRequest(minimum: _minimum, maximum: _maximum);
      }
    }

    final response =
        await stub.getSingleRandomWithMultipleConditions(requestBounds());
    setState(() {
      _value = response.value;
    });
  }

  void _getBidiRandom() async {
    Stream<RandomRequest> requestBounds() async* {
      while (_streamValues) {
        await Future.delayed(Duration(seconds: 1));
        yield RandomRequest(minimum: _minimum, maximum: _maximum);
      }
    }

    setState(() {
      _streamValues = true;
    });

    final responseStream = stub.getBidiRandom(requestBounds());
    setState(() {
      _responseStream = responseStream;
    });

    await for (var response in responseStream) {
      setState(() {
        _value = response.value;
      });
    }
  }

  void _cancelRequest() async {
    _responseStream?.cancel();
    setState(() {
      _responseStream = null;
      _streamValues = false;
    });
  }

  @override
  void initState() {
    super.initState();
    final channel = ClientChannel('192.168.43.8',
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = RandomExchangerServiceClient(channel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Enter bounds of range"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _minimum = int.tryParse(value);
                        });
                      },
                      controller: _minimumFieldController,
                      decoration: InputDecoration(hintText: "min"),
                    )),
                    Spacer(),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _maximum = int.tryParse(value);
                        });
                      },
                      controller: _maximumFieldController,
                      decoration: InputDecoration(hintText: "max"),
                    )),
                    Spacer(),
                  ],
                ),
                Spacer(),
                Text(
                  'You random number is:',
                ),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Spacer(),
              ]),
        ),
        floatingActionButton: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                if (_responseStream == null && _streamValues == false)
                  OutlinedButton(
                      onPressed: _getSingleRandom,
                      child: Text("Get Single Random")),
                if (_responseStream == null && _streamValues == false)
                  OutlinedButton(
                      onPressed: _getMultiConditionRandom,
                      child: Text("Get MultiConditional Random")),
                if (_responseStream == null  && _streamValues == false)
                  OutlinedButton(
                      onPressed: _getRandomsForEver,
                      child: Text("Get Multiple Randoms")),
                if (_responseStream == null  && _streamValues == false)
                  OutlinedButton(
                      onPressed: _getBidiRandom,
                      child: Text("Get Bidi Randoms")),
                if (_responseStream != null || _streamValues == true)
                  OutlinedButton(
                      onPressed: _cancelRequest, child: Text("Cancel Request"))
              ],
            )));
  }
}
