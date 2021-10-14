import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrintTime extends StatefulWidget {
  const PrintTime({Key key}) : super(key: key);

  @override
  _PrintTimeState createState() => _PrintTimeState();
}

class _PrintTimeState extends State<PrintTime> {
  String dateTime;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                onPressed: () {
                  setState(() {
                    _printDateTime();
                  });
                },
                child: Text('Print'),
              ),
            ],
          ),
        ],
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
    dateTime = prefs.getString('dateTime');
    return dateTime;
  }
}
