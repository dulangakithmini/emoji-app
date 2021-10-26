import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TodoService extends ChangeNotifier {
  List<String> _todoList = [];
  String _todo;

  int get todoCount => _counterSubject.valueOrNull;

  String get todo => _todo;

  List<String> get todos => _todoSubject.valueOrNull;

  final BehaviorSubject<List<String>> _todoSubject =
      BehaviorSubject<List<String>>();
  final BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();

  TodoService() {
    _todoSubject.listen((value) {
      _counterSubject.add(value.length);
    });

    // _todoSubject.listen((value) {
    //   showSnackBar(value);
    // });
  }

  void addTodo(String todo) {
    List<String> _currentTodos = _todoSubject.valueOrNull;
    if (_currentTodos == null) {
      _todoList.add(todo);
      _todoSubject.add(_todoList);
    } else {
      _todoList = _currentTodos;
      _todoList.add(todo);
      _todoSubject.add(_todoList);
    }
    notifyListeners();
  }

  void deleteTodo(String todo) {
    _todoList = _todoSubject.value;
    _todoList.remove(todo);
    _todoSubject.add(_todoList);
    notifyListeners();
  }

  void editTodo(String todo) {
    _todo = todo;
    notifyListeners();
  }

  @override
  void dispose() {
    _todoSubject.close();
    _counterSubject.close();
    super.dispose();
  }
}
