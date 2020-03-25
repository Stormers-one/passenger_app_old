import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_k/shared/busSerch.dart';
import 'package:o_k/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:o_k/model/busStop.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';
import 'package:o_k/Menu/times.dart';

class Timing extends StatefulWidget {
  @override
  _Timing createState() => _Timing();
}
class _Timing extends State<Timing> {
  final Authservice _auth = new Authservice();
  final DatabaseService _service = new DatabaseService();
  final List<String> bustype = <String>[
    'Bus Type',
    'Ordinary',
    'Limited Stop Ordinary',
    'Town to Town Ordinary',
    'Fast Passenger',
    'LS Fast Passenger',
    'Point to Point Fast Passenger',
    'Super Fast',
    'Super Express',
    'Super Dulex',
    'Garuda King Class Volvo',
    'Silver Line Jet',
    'Low Floor Non-AC',
    'Ananthapuri Fast',
    'Garuda Maharaja Scania',
    ];
List<String> bustime = [
  'Time',
  'Morning : 6AM to 12PM',
  'Afternoon: 12PM to 6PM',
  'Night: 6PM to 6AM',
];
String _currentBusType = "";
String _currenttime = "";
var queryResult = [];
  var busStopName = [];
  int count = 0;
  DatabaseService res = new DatabaseService();

initiateSearch(value){
  if(value.length == 0){
    setState(() {
      queryResult = [];
      busStopName = [];
    });
  }
    //if(queryResult.length == 0 && value.length == 1 ) {
      res.getBusStopList(value).then((QuerySnapshot docs){
        for (var i = 0; i < docs.documents.length; i++) {
          queryResult.add(docs.documents[i].data);
        }
      });
    //}
    //else{
      busStopName = [];
      queryResult.forEach((element){
        setState(() {
          if(element['Stop Name'].contains(value)){
            busStopName.add(element['Stop Name']);
          }
          
        });
      });
      print(busStopName);
      print("\n\n\n ");
      count++;
      print(count);
  }
final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BusStopData>>.value(
      value: DatabaseService().busStopData,
          child: MaterialApp(
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
                              style: new TextStyle(color: Colors.black),
                              // textCapitalization: TextCapitalization.characters,
                              onTap:(){                                 
                                showSearch(context: context, delegate: BusSearch());
                                selectedTimingStringFrom = selectedString;
                              },
                              initialValue: selectedTimingStringFrom,
                              decoration:textInputDecoration(selectedTimingStringFrom ??  "From"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new TextFormField(
                              style: new TextStyle(color: Colors.black),
                              onTap:(){ 
                                showSearch(context: context, delegate: BusSearch());
                                selectedTimingStringTo = selectedString;
                              },
                              textCapitalization: TextCapitalization.characters,
                              decoration: textInputDecoration(selectedTimingStringTo ?? "To"),
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              initialValue:selectedTimingStringTo,
                            ),

                            // SizedBox(
                            //   height: 60,
                            //   width: 300,
                            //   child: RaisedButton(
                            //   onPressed: () {
                            //     showSearch(context: context, delegate: BusSearch());
                            //   },
                            //     child: const Text('To',
                            //         style: TextStyle(fontSize: 20,)),
                            //     color: Colors.white,
                            //     textColor: Colors.grey,
                            //     splashColor: Colors.transparent,
                            //     //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius:
                            //             BorderRadius.circular(20.0),
                            //             side: BorderSide(color: Colors.grey[600]),),
                            //   ),
                            // ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                            ),
                            new DropdownButtonFormField(
                              hint: Text('Bus Type', style: TextStyle(color: Colors.grey),),
                              value: _currentBusType.isNotEmpty ? _currentBusType : null, 
                              items: bustype.map((value) =>
                                 new DropdownMenuItem(
                                  value:value,
                                  child: Text('$value'),
                                )   
                              ).toList(),
                              isExpanded: true,
                              onChanged: (val) => setState(() => _currentBusType = val),
                              decoration: textInputDecorationNoHint(),
                              ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new DropdownButtonFormField(
                              hint: Text('Time', style: TextStyle(color: Colors.grey),),
                              value: _currenttime.isNotEmpty ? _currenttime : null, 
                              items: bustime.map((value) =>
                                 new DropdownMenuItem(
                                  value:value,
                                  child: Text('$value'),
                                )   
                              ).toList(),
                              isExpanded: true,
                              onChanged: (val) => setState(() => _currenttime = val),
                              decoration: textInputDecorationNoHint(),
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
                                    builder: (context) =>
                                      Times()
                                  ),
                                );
                              },
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
        ),
    );
  }
}
