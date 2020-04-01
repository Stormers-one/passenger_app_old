import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_k/User/profile_settings.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:o_k/shared/colors.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState ();
}
class _ProfileState extends State<Profile>{ 
  @override
  Widget build(BuildContext context)  {
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
    final user = Provider.of<User>(context);
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
            elevation: 0,
            title: Text('Profile'),
            backgroundColor: red,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () => _showSettengsPanel(),
                  icon: Icon(Icons.settings),
                  label: Text('Edit Profile'))
            ]),
        drawer: DrawerBuild(),
        body: Builder(
          builder: (context) {
           return Container(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 90,
                              backgroundColor: Colors.red[500],
                              child: ClipOval(
                                child: SizedBox(
                                  width:170,
                                  height:170,
                                  child:(downURL == null) ? Image.asset(
                                    'assets/images/profile-icon.png',
                                    fit: BoxFit.fill, 
                                  )
                                  : Image.network('$downURL'), 
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    StreamBuilder<UserData>(
                        stream: DatabaseService(uid: user.uid).userData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            UserData userData = snapshot.data;
                            return Form(
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: userData.fname,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.account_box),
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: userData.email,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.email),
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: userData.phno,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.phone),
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Loading();
                          }
                        }),
                  ],
                ),
              ],
            ),
          );
          }
        ),
      ),
    );
  }
}
