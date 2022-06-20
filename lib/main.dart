import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  AppBlocModel model = AppBlocModel();
  runApp(BlockStarterSampleApp(
    model: model,
  ));
}

class BlockStarterSampleApp extends StatelessWidget {
  final AppBlocModel model;
  const BlockStarterSampleApp({Key? key, required this.model})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Sample with StreamController',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        model: model,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final AppBlocModel model;
  const MyHomePage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Sample with StreamController'),
      ),
      body: StreamBuilder<int>(
          initialData: model.counter,
          stream: model.counterSream,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.incrementCounter(5);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppBlocModel {
  final StreamController<int> _counterStreamController =
      StreamController.broadcast();

  Stream<int> get counterSream => _counterStreamController.stream;
  int get counter => _counter;
  int _counter = 0;

  AppBlocModel() {
    _counterStreamController.onListen = () {
      _counterStreamController.add(_counter);
    };
  }

  incrementCounter(int value) {
    _counter += value;
    _counterStreamController.add(_counter);
  }
}
