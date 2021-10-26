import 'package:emoji_app/screens/todo_editor_screen.dart';
import 'package:emoji_app/screens/todo_screen.dart';
import 'package:emoji_app/services/todo_service.dart';
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
      create: (_) => TodoService(),
      child: MaterialApp(
        routes: {
          TodoScreen.route: (context) => TodoScreen(),
          TodoEditorScreen.route: (context) => TodoEditorScreen()
        },
      ),
    );
  }
}
