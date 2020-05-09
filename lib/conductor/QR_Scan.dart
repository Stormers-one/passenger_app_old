import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/colors.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QR_Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'QR Scan',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('QR Scan'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
