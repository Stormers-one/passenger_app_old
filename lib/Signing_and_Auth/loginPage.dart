import 'dart:io';
import 'package:flutter/material.dart';
import 'package:o_k/Signing_and_Auth/resetpassword.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/Signing_and_Auth/register.dart';
import 'package:o_k/shared/background_login.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/loading.dart';
import 'package:o_k/shared/colors.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final Authservice _auth = new Authservice();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
// text file state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
          title: Text("Do You Really want to Exit?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("NO")),
            FlatButton(
                onPressed: () => Navigator.pop(context, exit(0)),
                child: Text("YES")),
          ],
        ));
    }
    return loading
        ? Loading()
        : WillPopScope(
            onWillPop: _onBackPressed,
            child: Scaffold(
              backgroundColor: Colors.orange[300],
              body: Stack(
                  children: <Widget>[ 
                    Background(),
                    GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Center(
                    child: Container(
                      // decoration: new BoxDecoration(
                      //   color: Colors.orange[300],
                      // ),
                      child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top:20,left:20,right:20),
                          children: <Widget>[
                            new Theme(
                              data: new ThemeData(
                                  fontFamily: 'Quicksand-Medium',
                                  brightness: Brightness.dark,
                                  inputDecorationTheme: new InputDecorationTheme(
                                    // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                                    labelStyle: new TextStyle(
                                        color: Colors.redAccent, fontSize: 25.0),
                                  )),
                              isMaterialAppTheme: true,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   new Padding(
                                    padding:
                                        const EdgeInsets.only(top: 50.0),
                                   ),
                                  Hero(
                                    tag: 'imageHero',
                                    child: new Container(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                      ),
                                      height: 200,
                                      width: 200,
                                    ),
                                  ),
                                  new Container(
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                      gradient: new LinearGradient(
                                          colors: [
                                            Colors.orange[600],
                                            Colors.red[300]
                                          ],
                                          begin: const FractionalOffset(0.5, 0.0),
                                          end: const FractionalOffset(0.0, 0.5),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withAlpha(60),
                                                blurRadius: 5,
                                                offset: Offset(0, 8),
                                                spreadRadius: 2)
                                          ]
                                    ),
                                    padding: const EdgeInsets.all(20.0),
                                    child: new Form(
                                      key: _formkey,
                                      autovalidate: true,
                                      child: new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          //SizedBox(height: 10),
                                          Text(
                                            error,
                                            style: TextStyle(
                                                color: red, fontSize: 14.0),
                                          ),
                                          new Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10.0),
                                          ),
                                          new TextFormField(
                                            initialValue: email,
                                            style: new TextStyle(
                                                color: Colors.orange),
                                            decoration:
                                                textInputDecoration("Email"),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            },
                                            validator: (val) =>
                                                val.isEmpty && clickStatLogin
                                                    ? 'Enter an Email'
                                                    : null,
                                          ),
                                          new Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10.0),
                                          ),
                                          new TextFormField(
                                            style: new TextStyle(
                                                color: Colors.orange),
                                            decoration:
                                                textInputDecoration("Password"),
                                            obscureText: true,
                                            keyboardType: TextInputType.text,
                                            onChanged: (val) {
                                              setState(() => password = val);
                                            },
                                            validator: (val) =>
                                                val.isEmpty && clickStatLogin
                                                    ? 'Enter password'
                                                    : null,
                                          ),
                                          new Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20.0),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 200,
                                            child: RaisedButton(
                                              onPressed: () async {
                                                clickStatLogin = true;
                                                if (_formkey.currentState
                                                    .validate()) {
                                                  setState(() => loading = true);

                                                  dynamic result = await _auth
                                                      .signInWithEmailAndPassword(
                                                          email, password);
                                                  if (result == null) {
                                                    setState(() {
                                                      error =
                                                          'Incorrect Email or Password';
                                                      loading = false;
                                                    });
                                                  }
                                                }
                                              },
                                              child: const Text('Login',
                                                  style: TextStyle(fontSize: 20)),
                                              color: red,
                                              textColor: Colors.white,
                                              splashColor: Colors.grey,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                          new Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20.0),
                                          ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => ResetPage()));
                                          },
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                        ],
                                      ),
                                    ),
                                    
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Don\'t have an account ?',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => RegisterPage()));
                                          },
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                                color: Color(0xfff79c4f),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                  ]
              ),
            ),
          );
  }
}
