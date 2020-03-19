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

class Homepage extends StatelessWidget {
  final Authservice _auth = new Authservice();

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Exit: Are you sure?"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("NO")),
                  FlatButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("YES"),
                  ),
                ],
              ));
    }
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
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
                    await _auth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                    );
                  },
                )
              ]),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red[500],
                  ),
                  child: Text(
                    'Odu Komban',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                ),
                /*ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Messages()),
                    );
                  },
                ),*/
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Users List'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Users_Count()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                ),
                /*ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                ),*/
                ListTile(
                  leading: Icon(Icons.report),
                  title: Text('Report'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                                child: Image.asset(
                                  'assets/logo.png',
                                ),
                                height: 200,
                                width: 200,
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
                                      side: BorderSide(color: Colors.transparent)),
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
                                        padding: const EdgeInsets.only(top: 2.0),
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
                                      side: BorderSide(color: Colors.transparent)),
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
                                        padding: const EdgeInsets.only(top: 2.0),
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
                                      side: BorderSide(color: Colors.transparent)),
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
                                        padding: const EdgeInsets.only(top: 2.0),
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
                                      side: BorderSide(color: Colors.transparent)),
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
                                        padding: const EdgeInsets.only(top: 2.0),
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
