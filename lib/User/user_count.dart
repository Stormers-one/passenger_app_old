import 'package:flutter/material.dart';
import 'package:o_k/User/profile_settings.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/User/user_list.dart';
import 'package:o_k/User/users_fetch.dart';
import 'package:provider/provider.dart';

class Users_Count extends StatelessWidget {
  final Authservice _auth = new Authservice();
  
  @override
  Widget build(BuildContext context) {
    void _showSettengsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 60.0),
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
            backgroundColor: Colors.green[100],
            actions: <Widget>[
              FlatButton.icon(onPressed: ()=> _showSettengsPanel(), icon: Icon(Icons.settings), label: Text('Edit Profile'))
            ]
          ),
          
          body: UserList(),
          ),
        ),
    );
  }
}
