import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';

class Track extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track',
      home: Scaffold(
        drawer: DrawerBuild(),
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Track'),
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
