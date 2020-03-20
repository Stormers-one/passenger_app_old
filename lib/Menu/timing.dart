import 'package:flutter/material.dart';
import 'package:o_k/Menu/times.dart';
import 'package:o_k/homepage.dart';
import 'package:o_k/Menu/help.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';
import 'package:o_k/shared/drawer.dart';

class Timing extends StatefulWidget {
  @override
  _Timing createState() => _Timing();
}
class _Timing extends State<Timing> {

  final List<String> bustype = <String>[
      'Ordinary',
      'Limited_Stop_Ordinary',
      'Town_to_Town Ordinary',
      'Fast_Passenger',
      'LS_Fast_Passenger',
      'Point_to_Point_Fast_Passenger',
      'Super_Fast',
      'Super_Express',
      'Super_Dulex',
      'Garuda_King_Class_Volvo',
      'Silver_Line_Jet',
      'Low_Floor_Non-AC',
      'Ananthapuri_Fast',
      'Garuda_Maharaja_Scania',
    ];
String _currentBusType = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Timing',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Bus Timing'),
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
                                decoration: new InputDecoration(
                                  hintText: 'From',
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: 'To',
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                ),
                                obscureText: false,
                                keyboardType: TextInputType.text,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                              ),
                              new DropdownButtonFormField(
                                hint: Text('Select Bus Type'),
                                value: _currentBusType.isNotEmpty ? _currentBusType : null, 
                                items: bustype.map((value) =>
                                   new DropdownMenuItem(
                                    value:value,
                                    child: Text('$value'),
                                  )   
                                ).toList(),
                                onChanged: (val) => setState(() => _currentBusType = val),
                                decoration: new InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                ),
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
