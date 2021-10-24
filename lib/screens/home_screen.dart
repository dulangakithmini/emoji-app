import 'package:emoji_app/resources/app_data.dart';
import 'package:emoji_app/screens/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String route = '/';

  const HomeScreen({Key key}) : super(key: key);

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
            Text('${context.watch<AppData>()}'),
            ElevatedButton(
                onPressed: () => onGoToOther(context),
                child: Text('Go to other screen')),
          ],
        ),
      ),
    );
  }

  void onGoToOther(BuildContext context) async {
    final userInput = await Navigator.pushNamed(context, OtherScreen.route);
    if (userInput == null) return;
  }
}
