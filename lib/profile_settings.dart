import 'package:flutter/material.dart';

import 'shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  
  final _formkey= GlobalKey<FormState>();
  
  String currentName;
  String currentphno;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(children: <Widget>[
        Text('Update Your Profile',
              style: TextStyle(fontSize:18.0),
        ),
        SizedBox(height: 20),
        TextFormField(          
          style:
            new TextStyle(color: Colors.orange),
            decoration: new InputDecoration(
            hintText: 'Full Name',
            hintStyle:
                new TextStyle(color: Colors.grey),
            fillColor: Colors.grey[300],
            filled: true,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white),
              borderRadius:
                  new BorderRadius.circular(25),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (val) => val.isEmpty ? ' Please enter a name' : null,
          onChanged: (val) => setState(()=> currentName= val),
        ),
         new Padding(
      padding: const EdgeInsets.only(top: 10.0),
    ),
    new TextFormField(
        validator: (val) => val.length < 10
            ? 'Enter a valid phone number'
            : null,
        style:
            new TextStyle(color: Colors.orange),
        decoration: new InputDecoration(
          //labelText: "Password:",
          //labelStyle: new TextStyle(
          //    fontSize: 15, color: Colors.red),
          hintText: 'Phone Number',
          hintStyle:
              new TextStyle(color: Colors.grey),
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white),
            borderRadius:
                new BorderRadius.circular(25),
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
          width: 200,
          child: RaisedButton(
              child: const Text('Update',
                  style: TextStyle(fontSize: 20)),
              color: Colors.red,
              textColor: Colors.white,
              splashColor: Colors.red,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0)),
              onPressed: () async{

              }
          ),
        ),
      ],)
    );
  }
}