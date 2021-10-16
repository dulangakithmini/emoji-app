import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Color colour;

  PostWidget({
    this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: colour,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
    );
  }

  Column buildPost() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(height: 25, width: 25, color: Colors.brown),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text('Dulanga Kithmini'),
                  Text(DateTime.now().toString().split('.')[0]),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz, color: Colors.grey),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Hi Nipuna... 😍 😘 '),
              SizedBox(height: 20),
              Container(height: 105, width: 75, color: Colors.blueGrey),
            ],
          ),
        ),
      ],
    );
  }
}
