import 'package:emoji_app/screens/names_fetcher_screen.dart';
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
        body: NamesFetcherScreen(),
      ),
    );
  }
}