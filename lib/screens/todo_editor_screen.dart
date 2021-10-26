import 'package:emoji_app/screens/todo_screen.dart';
import 'package:emoji_app/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoEditorScreen extends StatefulWidget {
  static String route = '/todo';

  const TodoEditorScreen({Key key}) : super(key: key);

  @override
  _TodoEditorScreenState createState() => _TodoEditorScreenState();
}

class _TodoEditorScreenState extends State<TodoEditorScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Todo',
              ),
            ),
            ElevatedButton(
              onPressed: () => onSubmit(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit(BuildContext context) {
    String _todo = _controller.text;
    _controller.clear();

    context.read<TodoService>().addTodo(_todo);
    Navigator.pushNamed(context, TodoScreen.route);
  }
}
