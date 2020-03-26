import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:o_k/User/profile_settings.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Ticket extends StatelessWidget {
  final Authservice _auth = new Authservice();
  List<String> qrdata;
  static var bookid = Random.secure();
  var values = List<int>.generate(10, (i) => bookid.nextInt(256));
  //var values = "ss";
  @override
  Widget build(BuildContext context) {
    String bid = "18fasfsa5fs1fs4f3safs1";
    final user = Provider.of<User>(context);
    return MaterialApp(
      title: 'Your Ticket',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
            elevation: 0,
            title: Text('Your Ticket'),
            backgroundColor: Colors.red[500],
            actions: <Widget>[
            ]),
        drawer: DrawerBuild(),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<UserData>(
                      stream: DatabaseService(uid: user.uid).userData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          UserData userData = snapshot.data;
                          return Form(
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  new TextField(
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: base64Url.encode(values),
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      icon: Icon(Icons.vpn_key),
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  new TextField(
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: userData.fname,
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      icon: Icon(Icons.account_box),
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  new TextField(
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: selectedBookingFrom,
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      icon: Icon(Icons.play_circle_outline),
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  new TextField(
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: selectedBookingTo,
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      icon: Icon(Icons.stop),
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                   SizedBox(height: 30),
                                  QrImage(
                                    data: "From: \"$selectedBookingFrom\" \nTo: \"$selectedBookingTo\" \nBooking ID: \"" + base64Url.encode(values) + "\" \nName: \"" + userData.fname + "\" \nEmail: \"" + userData.email + "\"",
                                    version: QrVersions.auto,
                                    size: 200.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Loading();
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
