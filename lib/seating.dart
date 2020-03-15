import 'package:flutter/material.dart';

class Seating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seating',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seating'),
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
