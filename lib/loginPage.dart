import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              style: new TextStyle(color: Colors.orange),
                              decoration: new InputDecoration(
                                  labelText: "Enter Email",
                                  fillColor: Colors.red),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              style: new TextStyle(color: Colors.orange),
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()),
                                );
                              },
                              child: const Text('Login',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.red,
                              textColor: Colors.orange,
                              splashColor: Colors.grey,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
