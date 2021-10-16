import 'package:emoji_app/widgets/post_widget.dart';
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
                    PostWidget(colour: Colors.greenAccent),
                    PostWidget(colour: Colors.deepOrangeAccent),
                    PostWidget(colour: Colors.lightBlue),
                    PostWidget(colour: Colors.yellow),
                    PostWidget(colour: Colors.pinkAccent),
                    PostWidget(colour: Colors.redAccent),
                    PostWidget(colour: Colors.indigo),
                    PostWidget(colour: Colors.purpleAccent),
                    PostWidget(colour: Colors.black),
                    PostWidget(colour: Colors.lightGreen),
                    PostWidget(colour: Colors.lightBlueAccent),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    buildColumn(),
                    SizedBox(
                      height: 15,
                    ),
                    buildColumn(),
                    SizedBox(
                      height: 15,
                    ),
                    buildColumn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      width: 70,
      color: Colors.orangeAccent,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.blue,
          ),
          Text(
            'Create story',
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }

  Column buildColumn() {
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
