import 'package:flutter/material.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/colors.dart';
import 'mapview.dart';

class Tracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('Tracking'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Center(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/bus_fleet.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Form(
                          autovalidate: true,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new TextFormField(
                                decoration: textInputDecoration("Fleet Number"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapView()),
                                    );
                                  },
                                  child: const Text('Search',
                                      style: TextStyle(fontSize: 20)),
                                  color: red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
