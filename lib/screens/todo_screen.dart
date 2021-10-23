import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final BehaviorSubject<List<String>> _todoSubject =
      BehaviorSubject<List<String>>();
  final TextEditingController _controller = TextEditingController();
  List<String> _todoList = [];
  final BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();

  @override
  void initState() {
    _todoSubject.listen((value) {
      _counterSubject.add(value.length);
    });

    _todoSubject.listen((value) {
      showSnackBar(value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _todoSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: onSubmit,
              child: Text('Submit'),
            ),
            SizedBox(height: 15),
            StreamBuilder<int>(
                stream: _counterSubject,
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Text(
                          '${snapshot.data} Todos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text('');
                }),
            StreamBuilder<List<String>>(
                stream: _todoSubject,
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, int index) {
                              return buildTodoList(snapshot.data, index);
                            },
                          ),
                        )
                      : Text('');
                }),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    String _todo = _controller.text;
    _controller.clear();
    List<String> _currentTodos = _todoSubject.valueOrNull;
    if (_currentTodos == null) {
      _todoList.add(_todo);
      _todoSubject.add(_todoList);
    } else {
      _todoList = _currentTodos;
      _todoList.add(_todo);
      _todoSubject.add(_todoList);
    }
  }

  Widget buildTodoList(List<String> todos, int index) {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: Colors.lightBlueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todos[index],
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () {
                onClose(todos[index]);
              },
              icon: Icon(Icons.close),
              color: Colors.red)
        ],
      ),
    );
  }

  void onClose(String todo) {
    _todoList = _todoSubject.value;
    _todoList.remove(todo);
    _todoSubject.add(_todoList);
  }

  void showSnackBar(value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Todo created - ${value.last}'),
      ),
    );
  }
}
