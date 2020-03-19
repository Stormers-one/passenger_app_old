import 'package:flutter/material.dart';
import 'package:o_k/homepage.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Help'),
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'Odu Komban',
                    style: TextStyle(
                      color: Colors.orange,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Helpline No.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          
                        ),
                      ),
                    
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'KeralaRTC Hub',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Developers',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nAnandu R\nAfthab Nihar\nAishwarya Michael\nRachel Kunjumon\nSmitha John\nKennith Philips',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Facts',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          
                        ),
                      ),
                    
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Maps',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Booking',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Tracking',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Timing',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
