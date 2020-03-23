import 'dart:io';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:o_k/Wrapper.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/Menu/booking.dart';
import 'package:o_k/Menu/help.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/Menu/timing.dart';
import 'package:o_k/Menu/tracking.dart';
import 'package:o_k/Menu/maps.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';

class Homepage extends StatefulWidget{
  // Homepage({Key key}) : super(key: key);
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  final Authservice _auth = new Authservice();
  @override
  Widget build(BuildContext context) {
    // Future<bool> _onBackPressed() {
    //   return showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             title: Text("Exit: Are you sure?"),
    //             actions: <Widget>[
    //               FlatButton(
    //                   onPressed: () => Navigator.pop(context, false),
    //                   child: Text("NO")),
    //               FlatButton(
    //                 onPressed: () => Navigator.pop(context, exit(0)),
    //                 child: Text("YES"),
    //               ),
    //             ],
    //           ));
    // }
    return MaterialApp(
      title: 'Homepage',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
            //title: Text('MENU'),
            backgroundColor: Colors.red[500],
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  clickStatLogin = false;
                  clickStatRegister = false;
                  await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wrapper()),
                  );
                },
              )
            ]),
        drawer: DrawerBuild(),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
              content: Text(
            'Press Back Again To Exit',
            textAlign: TextAlign.center,
          )),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'imageHero',
                    child: new Container(
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.rectangle,
                      /*borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0))*/
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    //height:
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  fillColor: Colors.orange[500],
                                  splashColor: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                          'assets/map.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      new Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                      ),
                                      Text('Maps'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Maps()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  fillColor: Colors.orange[500],
                                  splashColor: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                          'assets/route.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      new Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                      ),
                                      Text('Timing'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Timing()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RawMaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  fillColor: Colors.orange[500],
                                  splashColor: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                          'assets/position.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      new Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                      ),
                                      Text('Tracking'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Tracking()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  fillColor: Colors.orange[500],
                                  splashColor: Colors.grey,
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                          'assets/seatbus.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      new Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                      ),
                                      Text('Booking'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Booking()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                //overflow: Overflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
