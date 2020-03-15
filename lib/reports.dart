import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reports',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reports'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height:
                    Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              
            )
          ],
        ),
      ),
    );
  }
}
