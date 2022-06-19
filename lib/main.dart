import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const BlockStarterSampleApp());
}

class BlockStarterSampleApp extends StatelessWidget {
  const BlockStarterSampleApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Sample with StreamController',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bloc Sample with StreamController'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

//set up the stream controller but in production you would be getting your streems from
// either sockets or some other web services

//you use the .broadcast() function if you are gonna be supplying for more than one stream
  final StreamController<int> _streamController = StreamController.broadcast();

  void _incrementCounter() {
    _streamController.stream.listen((event) {
      setState(() {
        _counter = event;
        log(event.toString());
      });
    });
  }

  _MyHomePageState() {
    _incrementCounter();
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.add(_counter + 1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
