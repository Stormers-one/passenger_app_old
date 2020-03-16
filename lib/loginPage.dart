import 'package:flutter/material.dart';
import 'homepage.dart';
import './services/auth.dart';
import './register.dart';

class LoginPage extends StatefulWidget {

final Function toggleView;
LoginPage({this.toggleView});

@override
_LoginState createState() => _LoginState();  
}
class _LoginState extends State<LoginPage>{  
final Authservice _auth = new Authservice();
final _formkey = GlobalKey<FormState>();

// text fiel state 
String email ="";
String password ="";
String error = "";

  @override 
  Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                new Theme(
                  data: new ThemeData(
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
                      new Container(
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                        height: 300,
                        width: 300,
                      ),
                      new Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Form(
                          key:_formkey,
                          autovalidate: true,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new TextFormField(
                                validator: (val) =>val.isEmpty ?'Enter an Email': null,
                                style: new TextStyle(color: Colors.orange),
                                decoration: new InputDecoration(
                                    labelText: "Enter Email",
                                    fillColor: Colors.red),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  setState(()=> email = val);
                                }
                              ),
                              new TextFormField(
                                validator: (val) =>val.length < 8 ?'Enter a password >8 Characters': null,
                                style: new TextStyle(color: Colors.orange),
                                decoration: new InputDecoration(
                                  labelText: "Enter Password",
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                onChanged: (val) {
                                  setState(()=> password = val);
                                }
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                              ),
                              RaisedButton(
                                onPressed: () async {
                                   if (_formkey.currentState.validate()){
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    if(result == null){
                                      setState(()=> error= 'Incorrect Email or Password');
                                    }
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Homepage()),
                                  // );
                                },
                                child: const Text('Login',
                                    style: TextStyle(fontSize: 20)),
                                color: Colors.red,
                                textColor: Colors.orange,
                                splashColor: Colors.grey,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                  //widget.toggleView();
                                },
                                child: const Text('Register',
                                    style: TextStyle(fontSize: 20)),
                                color: Colors.red,
                                textColor: Colors.orange,
                                splashColor: Colors.grey,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              ),
                              SizedBox(height: 30),
                              Text(
                                error,
                                style: TextStyle(color: Colors.red, fontSize:14.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      );
  }
}
