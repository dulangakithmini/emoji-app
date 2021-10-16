import 'package:emoji_app/widgets/post_widget.dart';
import 'package:emoji_app/widgets/story_widget.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'facebook',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.search),
                  Icon(Icons.chat),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.blue),
                  Icon(Icons.ondemand_video),
                  Icon(Icons.storefront),
                  Icon(Icons.branding_watermark),
                  Icon(Icons.notifications_none),
                  Icon(Icons.menu),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(height: 25, width: 25, color: Colors.brown),
                  Container(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'What\'s on your mind?',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.video_camera_front,
                        color: Colors.red,
                      ),
                      Text('Live'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.photo_library, color: Colors.green),
                      Text('Photo'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.pink),
                      Text('Check in'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    StoryWidget(colour: Colors.greenAccent),
                    StoryWidget(colour: Colors.deepOrangeAccent),
                    StoryWidget(colour: Colors.lightBlue),
                    StoryWidget(colour: Colors.yellow),
                    StoryWidget(colour: Colors.pinkAccent),
                    StoryWidget(colour: Colors.redAccent),
                    StoryWidget(colour: Colors.indigo),
                    StoryWidget(colour: Colors.purpleAccent),
                    StoryWidget(colour: Colors.black),
                    StoryWidget(colour: Colors.lightGreen),
                    StoryWidget(colour: Colors.lightBlueAccent),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    PostWidget(
                        colour: Colors.brown,
                        name: 'Dulanga Kithmini',
                        postColour: Colors.teal),
                    SizedBox(height: 15),
                    PostWidget(
                        colour: Colors.pinkAccent,
                        name: 'Nipuna Sudharaka',
                        postColour: Colors.blueGrey),
                    SizedBox(height: 15),
                    PostWidget(
                        colour: Colors.yellowAccent,
                        name: 'Phi Ball',
                        postColour: Colors.lightGreenAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
