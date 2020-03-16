import 'package:flutter/material.dart';
import 'booking.dart';
import 'help.dart';
import 'reports.dart';
import 'timing.dart';
import 'tracking.dart';
import 'maps.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: Scaffold(
        appBar: AppBar(
          //title: Text('MENU'),
          backgroundColor: Colors.green[100],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.report),
                title: Text('Report'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(image: new ExactAssetImage(
                      'assets/homepage.png',
                    ),)
                    
                    ),
                    child: Image.asset(
                      'assets/homepage.png',
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(0.0),  //REMOVED CONTAINER BORDER RADIUS 
                            topRight: const Radius.circular(0.0))),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                /*Container(
                                  child: Image.asset(
                                    'assets/map.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Maps()),
                                    );
                                  },
                                  child:
                                      const Text('Map', style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),
                                */
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
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                /*Container(
                                  child: Image.asset(
                                    'assets/route.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Timing()),
                                    );
                                  },
                                  child: const Text('Timing',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),
                                */
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
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                /*Container(
                                  child: Image.asset(
                                    'assets/position.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Tracking()),
                                    );
                                  },
                                  child: const Text('Tracking',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),
                                */
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
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                /*Container(
                                  child: Image.asset(
                                    'assets/seatbus.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Booking()),
                                    );
                                  },
                                  child: const Text('Booking',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),*/
                              ],
                            ),
                          ],
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                          'assets/question.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text('Help'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Help()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                                /*Container(
                                  child: Image.asset(
                                    'assets/question.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Help()),
                                    );
                                  },
                                  child: const Text('Help',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),*/
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
                                      side: BorderSide(color: Colors.black)),
                                  fillColor: Colors.orange[300],
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
                                          'assets/report.png',
                                        ),
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text('Report'),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Reports()),
                                    );
                                  },
                                ),
                                SizedBox(height: 30),
                                /*RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Reports()),
                                    );
                                  },
                                  child: const Text('Report',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),*/
                              ],
                            ),
                          ],
                        )
                      */
/*                Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 30),
                                Container(
                                  child: Image.asset(
                                    'assets/question.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Help()),
                                    );
                                  },
                                  child: const Text('Help',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 30),
                                Container(
                                  child: Image.asset(
                                    'assets/report.png',
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Reports()),
                                    );
                                  },
                                  child: const Text('Report',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                ),
                              ],
                            ),
                          ],
                        )
*/
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
