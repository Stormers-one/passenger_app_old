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

class _LoginState extends State<LoginPage> {
  final Authservice _auth = new Authservice();
  final _formkey = GlobalKey<FormState>();

// text file state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    
  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Do You Really want to Exit?"),
        actions: <Widget>[
          FlatButton(onPressed: ()=>Navigator.pop(context,false), child: Text("NO")),
          FlatButton(onPressed: ()=>Navigator.pop(context,true), child: Text("YES")),
        ],
      )
    );
  }  
    
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        // backgroundColor: new LinearGradient(colors:[]),
        body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [Colors.orange[300], Colors.green[100]],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            ),
          ),
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
                          key: _formkey,
                          autovalidate: true,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an Email' : null,
                                  style: new TextStyle(color: Colors.orange),
                                  decoration: new InputDecoration(
                                      labelText: "Enter Email",
                                      fillColor: Colors.red),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              new TextFormField(
                                  validator: (val) => val.length < 8
                                      ? 'Enter a password >8 Characters'
                                      : null,
                                  style: new TextStyle(color: Colors.orange),
                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                  ),
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              new Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() =>
                                          error = 'Incorrect Email or Password');
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
                                textColor: Colors.white,
                                splashColor: Colors.grey,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 20.0),
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
                                textColor: Colors.white,
                                splashColor: Colors.grey,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              ),
                              SizedBox(height: 30),
                              Text(
                                error,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        },
                        child:
                            const Text('Direct', style: TextStyle(fontSize: 20)),
                        color: Colors.red,
                        textColor: Colors.white,
                        splashColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
