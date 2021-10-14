import 'package:emoji_app/screens/print_time.dart';
import 'package:flutter/material.dart';

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
      body: PrintTime(),
    ));
  }
}

class MyNumber extends StatefulWidget {
  const MyNumber({Key key}) : super(key: key);

  @override
  _MyNumberState createState() => _MyNumberState();
}

class _MyNumberState extends State<MyNumber> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _decreaseNumber(),
          Text('$number'),
          _increaseNumber(),
        ],
      ),
    );
  }

  Widget _decreaseNumber() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          number--;
        });
      },
      child: Text('Decrease value'),
    );
  }

  Widget _increaseNumber() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          number++;
        });
      },
      child: Text('Increase value'),
    );
  }
}
