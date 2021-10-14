import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimePrinterScreen extends StatefulWidget {
  const TimePrinterScreen({Key key}) : super(key: key);

  @override
  _TimePrinterScreenState createState() => _TimePrinterScreenState();
}

class _TimePrinterScreenState extends State<TimePrinterScreen> {
  String dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Printer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dateTime ?? ''),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveDateTime,
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: _printDateTime,
                  child: Text('Print'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _saveDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dateTime', new DateTime.now().toString());
    print('Saved date and time');
  }

  _printDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dateTime = prefs.getString('dateTime');
    });
  }
}
