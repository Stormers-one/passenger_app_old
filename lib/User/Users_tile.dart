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
<<<<<<< HEAD
          color: Colors.orange[300],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
          ),
=======
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.orange[200],
>>>>>>> d504d48628dc8b15eccbdb7da091d38d938dc0f8
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
