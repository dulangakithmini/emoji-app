import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
        title: Text('Emoji App'),
      ),
      body: MyNumber(),
    ));
  }
}

class MyNumber extends StatefulWidget {
  const MyNumber({Key key}) : super(key: key);

  @override
  _MyNumberState createState() => _MyNumberState();
}

class _MyNumberState extends State<MyNumber> {
  int number;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _decreaseNumber(),
          Text('${number ?? '0'}'),
          _increaseNumber(),
        ],
      ),
    );
  }

  Widget _decreaseNumber() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _decrement();
        });
      },
      child: Text('Decrease value'),
    );
  }

  Widget _increaseNumber() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _increment();
        });
      },
      child: Text('Increase value'),
    );
  }

  _increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    number = (prefs.getInt('number') ?? 0) + 1;
    await prefs.setInt('number', number);
  }

  _decrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    number = (prefs.getInt('number') ?? 0) - 1;
    await prefs.setInt('number', number);
  }
}
