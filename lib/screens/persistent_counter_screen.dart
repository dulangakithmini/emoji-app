import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentCounterScreen extends StatefulWidget {
  const PersistentCounterScreen({Key key}) : super(key: key);

  @override
  _PersistentCounterScreenState createState() =>
      _PersistentCounterScreenState();
}

class _PersistentCounterScreenState extends State<PersistentCounterScreen> {
  int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _decreaseNumber(),
            Text('${number ?? '0'}'),
            _increaseNumber(),
          ],
        ),
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
