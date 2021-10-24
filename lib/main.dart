import 'package:emoji_app/resources/app_data.dart';
import 'package:emoji_app/screens/home_screen.dart';
import 'package:emoji_app/screens/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppData(),
      child: MaterialApp(
        routes: {
          HomeScreen.route: (context) => HomeScreen(),
          OtherScreen.route: (context) => OtherScreen()
        },
      ),
    );
  }
}
