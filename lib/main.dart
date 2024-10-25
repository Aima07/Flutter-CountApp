import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Count App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(73, 54, 40, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Testing Count App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        _counter = 0;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(73, 54, 40, 1),
          title: Text(widget.title),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Current count:',
                  style: const TextStyle(fontSize: 24),
                ),
                Row(children: <Widget>[
                  TextButton(
                    onPressed:
                        _counter == 10 ? _resetCounter : _decrementCounter,
                    //  tooltip: _counter == 10 ? 'Reset' : 'Decrement',
                    child: Icon(_counter == 10 ? Icons.refresh : Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: _counter < 10 ? _incrementCounter : null,
                    //tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
      // Remove or comment out the existing floatingActionButton
      // floatingActionButton: ...
    );
  }
}
