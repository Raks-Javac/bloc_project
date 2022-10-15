import 'package:bloc_project/bloc_with_cubit_init/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(BlockStageThreeApp());
// }
class BlockStageThreeApp extends StatelessWidget {
  const BlockStageThreeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Sample with StreamBuilder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //do a dependency injection with bloc
    final blocInjection = BlocProvider.of<CounterCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit and BlocProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${blocInjection.state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                blocInjection.incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            SizedBox(
              width: 3,
            ),
            FloatingActionButton(
              onPressed: () {
                blocInjection.deCrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
