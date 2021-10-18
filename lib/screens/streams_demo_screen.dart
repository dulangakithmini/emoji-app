import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamsDemoScreen extends StatefulWidget {
  const StreamsDemoScreen({Key key}) : super(key: key);

  @override
  _StreamsDemoScreenState createState() => _StreamsDemoScreenState();
}

class _StreamsDemoScreenState extends State<StreamsDemoScreen> {
  String expression;
  String value;

  final BehaviorSubject<String> _expressionSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _numberSubject = BehaviorSubject<String>();
  Stream<String> _responseStream;

  @override
  void initState() {
    _responseStream = Rx.combineLatest2(
        _expressionSubject, _numberSubject, (a, b) => createExpression(a, b));
    super.initState();
  }

  @override
  void dispose() {
    _expressionSubject.close();
    _numberSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Expression',
              ),
              onChanged: (String value) {
                expression = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Value',
              ),
              onChanged: (String number) {
                value = number;
              },
            ),
            StreamBuilder<String>(
                stream: _responseStream,
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? Text('${snapshot.data}')
                      : Text('');
                }),
            ElevatedButton(
                onPressed: () {
                  _expressionSubject.add(expression);
                  _numberSubject.add(value);
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }

  String createExpression(stream1, stream2) {
    print(stream1.toString().replaceAll('x', stream2.toString()));
    return stream1.toString().replaceAll('x', stream2.toString());
  }
}
