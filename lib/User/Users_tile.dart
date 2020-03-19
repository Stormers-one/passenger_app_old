import 'package:flutter/material.dart';
import 'package:o_k/User/users_fetch.dart';

class UsersTile extends StatelessWidget {
  final Users user;
  UsersTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
             leading: Image.asset(
                      'assets/profile-icon.png',
                    ), 
            //  CircleAvatar(
            //    radius: 50.0,
            //    backgroundColor: Colors.red[300],
            //  ),
            title: Text(user.fname),
          ),
        ));
  }
}
