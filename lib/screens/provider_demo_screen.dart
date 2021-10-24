import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemoScreen extends StatelessWidget {
  const ProviderDemoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: 7,
      child: Scaffold(
        body: Column(
          children: [
            Builder(builder: (innerContext) {
              return ElevatedButton(
                onPressed: () {
                  print(innerContext.read<int>());
                },
                child: Text('Click ${innerContext.watch<int>()}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
