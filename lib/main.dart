import 'package:emoji_app/screens/home_screen.dart';
import 'package:emoji_app/screens/other_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Emoji App'),
      //   ),
      // ),
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        OtherScreen.route: (context) => OtherScreen()
      },
    );
  }
}
