import 'dart:convert';

import 'package:emoji_app/models/user_model.dart';
import 'package:emoji_app/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class NamesFetcherScreen extends StatefulWidget {
  const NamesFetcherScreen({Key key}) : super(key: key);

  @override
  _NamesFetcherScreenState createState() => _NamesFetcherScreenState();
}

class _NamesFetcherScreenState extends State<NamesFetcherScreen> {
  int counter = 0;
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserList(users),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUser,
        child: Text('Fetch'),
      ),
    );
  }

  void _fetchUser() async {
    counter++;

    var response = await get(
        Uri.parse('http://jsonplaceholder.typicode.com/users/$counter'));
    var userModel = UserModel.fromJson(json.decode(response.body));

    setState(() {
      users.add(userModel);
    });
  }
}
