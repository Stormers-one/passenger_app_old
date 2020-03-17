import 'package:flutter/material.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/user_list.dart';
import 'package:o_k/users_fetch.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final Authservice _auth = new Authservice();
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Users>>.value(
      value: DatabaseService().users,
          child: MaterialApp(
          title: 'Homepage',
          home: Scaffold(
          appBar: AppBar(
            title: Text('Users List'),
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
                    'Users List',
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
          body: UserList(),
          ),
        ),
    );
  }
}
