import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Color colour;

  PostWidget({
    @required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: colour,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
    );
  }
}
