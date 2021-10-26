import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TodoService extends ChangeNotifier {
  List<String> _todoList = [];

  int get todoCount => _counterSubject.valueOrNull;

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

  @override
  void dispose() {
    _todoSubject.close();
    _counterSubject.close();
    super.dispose();
  }
}
