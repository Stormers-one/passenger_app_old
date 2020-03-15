import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'homepage.dart';
import 'help.dart';
import 'reports.dart';
import 'tracking.dart';
import 'timing.dart';
import 'maps.dart';

void main() => runApp(new O_k());


class O_k extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.red, accentColor: Colors.redAccent),
      home: LoginPage(),
    );
  }
}
