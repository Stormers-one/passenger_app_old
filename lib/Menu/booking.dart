import 'package:flutter/material.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Booking'),
          backgroundColor: Colors.red[500],
        ),
        drawer: DrawerBuild(),
        body: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Form(
                          autovalidate: true,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new TextFormField(
                                decoration: textInputDecoration("From"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                              ),
                              new TextFormField(
                                decoration: textInputDecoration("To"),
                                obscureText: false,
                                keyboardType: TextInputType.text,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                              ),
                              new TextFormField(
                                decoration: textInputDecoration("Date Of Departure"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: const Text('Search',
                                      style: TextStyle(fontSize: 20)),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.transparent),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
