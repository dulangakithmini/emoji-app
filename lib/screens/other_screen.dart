import 'package:emoji_app/mixins/after_layout_mixin.dart';
import 'package:emoji_app/resources/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherScreen extends StatefulWidget {
  static String route = '/other';

  const OtherScreen({Key key}) : super(key: key);

  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> with AfterLayoutMixin {
  final TextEditingController _controller = TextEditingController();

  @override
  void afterFirstLayout(BuildContext context) {
    _controller.text = context.read<AppData>().textInput;
  }

  // @override
  // void initState() {
  //   WidgetsBinding.instance.endOfFrame.then((value) =>
  //       _controller.text = ModalRoute.of(context).settings.arguments as String);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () => onSubmit(context), child: Text('Submit')),
          ],
        ),
      ),
    );
  }

  onSubmit(BuildContext context) {
    context.read<AppData>().setTextInput(_controller.text);
    Navigator.pop(context);
  }
}
