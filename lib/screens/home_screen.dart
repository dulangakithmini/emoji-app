import 'package:emoji_app/screens/other_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('$currentMessage'),
            ElevatedButton(
                onPressed: () => onGoToOther(context),
                child: Text('Go to other screen')),
          ],
        ),
      ),
    );
  }

  void onGoToOther(BuildContext context) async {
    final userInput = await Navigator.pushNamed(context, OtherScreen.route,
        arguments: currentMessage);
    if (userInput == null) return;
    setState(() {
      currentMessage = userInput;
    });
  }
}
