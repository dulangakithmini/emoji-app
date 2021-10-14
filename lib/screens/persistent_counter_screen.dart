import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentCounterScreen extends StatefulWidget {
  const PersistentCounterScreen({Key key}) : super(key: key);

  @override
  _PersistentCounterScreenState createState() =>
      _PersistentCounterScreenState();
}

class _PersistentCounterScreenState extends State<PersistentCounterScreen> {
  int _number;

  void initState() {
    _getNumber().then((number) {
      setState(() {
        _number = number;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _onDecrement,
              child: Text('Decrease value'),
            ),
            Text('${_number ?? '0'}'),
            ElevatedButton(
              onPressed: _onIncrement,
              child: Text('Increase value'),
            ),
          ],
        ),
      ),
    );
  }

  _onIncrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _number = (prefs.getInt('number') ?? 0) + 1;
    });
    await prefs.setInt('number', _number);
  }

  _onDecrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _number = (prefs.getInt('number') ?? 0) - 1;
    });
    await prefs.setInt('number', _number);
  }

  Future<int> _getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('number');
  }
}
