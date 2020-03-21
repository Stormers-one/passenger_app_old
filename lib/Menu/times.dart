import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';

class Times extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times',
      home: Scaffold(
        drawer: DrawerBuild(),
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Times'),
          leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: Colors.black),
               onPressed: () => Navigator.of(context).pop(),
              ), 
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
          ],
        ),
      ),
    );
  }
}
