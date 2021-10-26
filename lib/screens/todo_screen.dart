import 'package:emoji_app/screens/todo_editor_screen.dart';
import 'package:emoji_app/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  static String route = '/';

  const TodoScreen({Key key}) : super(key: key);

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
            Center(
                child: ElevatedButton(
                    onPressed: () => onAdd(context), child: Text('Add Todo'))),
            SizedBox(height: 15),
            Text(
              context.watch<TodoService>().todoCount == null
                  ? 'No Todos added'
                  : '${context.watch<TodoService>().todoCount} Todos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            context.watch<TodoService>().todos != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: context.watch<TodoService>().todos.length,
                      itemBuilder: (context, int index) {
                        return buildTodoList(
                            context.watch<TodoService>().todos, index);
                      },
                    ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }

  Widget buildTodoList(List<String> todos, int index) {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: Colors.lightBlueAccent),
      child: Row(
        children: [
          Text(
            todos[index],
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                onEdit(context, todos[index]);
              },
              icon: Icon(Icons.edit),
            );
          }),
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  onClose(context, todos[index]);
                },
                icon: Icon(Icons.close),
                color: Colors.red);
          })
        ],
      ),
    );
  }

  void onClose(BuildContext context, String todo) {
    context.read<TodoService>().deleteTodo(todo);
  }

  void onAdd(BuildContext context) {
    Navigator.pushNamed(context, TodoEditorScreen.route);
  }

  void onEdit(BuildContext context, String todo) {
    context.read<TodoService>().editTodo(todo);
    context.read<TodoService>().deleteTodo(todo);
    Navigator.pushNamed(context, TodoEditorScreen.route);
  }
}
