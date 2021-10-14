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
      body: users.length == 0
          ? Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 23),
              ),
            )
          : UserList(users),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFetch,
        child: Text('Fetch'),
      ),
    );
  }

  void _onFetch() async {
    var response =
        await get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    List<dynamic> usersList = json.decode(response.body);

    setState(() {
      for (var item = 0; item < usersList.length; item++) {
        var userModel = UserModel.fromJson(usersList[item]);
        users.add(userModel);
      }
    });
  }
}
