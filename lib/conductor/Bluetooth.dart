import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/colors.dart';


class Bluetooth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Bluetooth',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('Bluetooth'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ),
    );
  }
}
