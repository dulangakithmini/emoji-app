import 'package:emoji_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;

  UserList(this.users);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, int index) {
        return buildContainer(index);
      },
    );
  }

  Container buildContainer(int index) {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: Colors.tealAccent),
      child: Text(
        users[index].name,
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
