import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  String _textInput;

  String get textInput => _textInput;

  void setTextInput(textInput) {
    _textInput = textInput;
    notifyListeners();
  }

  @override
  String toString() {
    return '$_textInput';
  }
}
