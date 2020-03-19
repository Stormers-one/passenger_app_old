import 'package:flutter/material.dart';
import 'package:o_k/User/profile_settings.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/User/user_list.dart';
import 'package:o_k/User/users_fetch.dart';
import 'package:provider/provider.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/homepage.dart';

class Users_Count extends StatelessWidget {
  final Authservice _auth = new Authservice();

  @override
  Widget build(BuildContext context) {
    void _showSettengsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Users>>.value(
      value: DatabaseService().users,
      child: MaterialApp(
        title: 'Homepage',
        home: Scaffold(
          appBar: AppBar(
              title: Text('Users List'),
              backgroundColor: Colors.orange[200],
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => _showSettengsPanel(),
                    icon: Icon(Icons.settings),
                    label: Text('Edit Profile'))
              ]),
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
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                ),
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
