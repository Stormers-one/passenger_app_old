import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();

  String currentName;
  String currentphno;
  
  File _image;
Future uploadPicture(BuildContext context) async{
  //File m = await getImageFileFromAssets('images/profile-icon.png');
  StorageReference firebaseStorageref = FirebaseStorage.instance.ref().child('profile_image/$userID');
  StorageUploadTask uploadTask = firebaseStorageref.putFile(_image);
  StorageTaskSnapshot taskSnapshot =  await uploadTask.onComplete;
  Fluttertoast.showToast(msg: 'Profile Picture Uploaded');
}

  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      var image  = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=image;
        print("Image Path $_image");
      });
    }
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update Your Profile',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: userData.fname,
                      style: new TextStyle(color: Colors.grey),
                      decoration: new InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: new TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(25),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          val.isEmpty ? 'Enter Full Name' : null,
                      onChanged: (val) => setState(() => currentName = val),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    new TextFormField(
                        initialValue: userData.phno,
                        validator: (val) => val.length != 10.0
                            ? 'Enter valid 10 Digit Phone Nmber'
                            : null,
                        style: new TextStyle(color: Colors.grey),
                        decoration: new InputDecoration(
                          //labelText: "Password:",
                          //labelStyle: new TextStyle(
                          //    fontSize: 15, color: red),
                          hintText: 'Phone Number',
                          hintStyle: new TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() => currentphno = val);
                        }),
                        new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: RaisedButton(
                          child: const Text('Upload Profile Photo',
                              style: TextStyle(fontSize: 12,fontFamily: 'Quicksand-Bold',),
                              textAlign: TextAlign.center,
                              
                              ),
                          color: red,
                          textColor: Colors.white,
                          splashColor: red,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.transparent),),
                          onPressed: () async {
                            Fluttertoast.showToast(msg: 'Wait For Upload Status');
                            await getImage();
                            await uploadPicture(context);
                          }),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                          child: const Text('Update',
                              style: TextStyle(fontSize: 20,fontFamily: 'Quicksand-Bold',)),
                          color: red,
                          textColor: Colors.white,
                          splashColor: red,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.transparent),),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                      currentName ?? userData.fname,
                                      userData.email,
                                      currentphno ?? userData.phno);
                              Navigator.pop(context);
                            }
                          }),
                    ),
                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}
