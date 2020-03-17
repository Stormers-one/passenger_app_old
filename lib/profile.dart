import 'package:flutter/material.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  final Authservice _auth = new Authservice();
  
  @override
  Widget build(BuildContext context) {
      Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Logout?"),
        actions: <Widget>[
          FlatButton(onPressed: ()=>Navigator.pop(context,false), child: Text("NO")),
          FlatButton(onPressed: ()=>Navigator.pop(context,true), child: Text("YES")),
        ],
      )
    );
  } 
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
          child: WillPopScope(
        onWillPop: _onBackPressed,
            child: MaterialApp(
          title: 'Homepage',
          home: Scaffold(
            appBar: AppBar(
              //title: Text('MENU'),
              backgroundColor: Colors.green[100],
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                )
              ]
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
                      'Profile',
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

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
