import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final Color colour;
  final Color postColour;

  PostWidget({@required this.name, this.colour, this.postColour});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(height: 25, width: 25, color: colour),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(name),
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
              Container(height: 105, width: 75, color: postColour),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [Icon(Icons.thumb_up_off_alt), Text('Like')],
            ),
            Row(
              children: [Icon(Icons.chat_bubble_outline), Text('Comment')],
            ),
            Row(
              children: [Icon(Icons.share), Text('Share')],
            ),
          ],
        ),
      ],
    );
  }
}
