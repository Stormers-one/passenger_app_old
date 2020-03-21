import 'package:flutter/material.dart';
import 'package:o_k/model/busStop.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';

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
  'Bus Time',
  'Morning : 6AM to 12PM',
  'Afternoon: 12PM to 6PM',
  'Night: 6PM to 6AM',
];
String _currentBusType = "";
String _currenttime = "";
DatabaseService res = new DatabaseService();
String _bus = "";
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
                              onChanged:(String query) async {
                                dynamic _bus = await res.getBusStopList(query);
                                print(_bus);
                              },
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
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new DropdownButtonFormField(
                              hint: Text('Bus Time', style: TextStyle(color: Colors.grey),),
                              value: _currenttime.isNotEmpty ? _currenttime : null, 
                              items: bustime.map((value) =>
                                 new DropdownMenuItem(
                                  value:value,
                                  child: Text('$value'),
                                )   
                              ).toList(),
                              isExpanded: true,
                              onChanged: (val) => setState(() => _currenttime = val),
                              decoration: new InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: new BorderRadius.circular(20),
                                ),
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
                              // onPressed: () async {
                                
                              // },
                              onPressed: () {
                                Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Times()),
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
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: RaisedButton(
                                onPressed: () async {
                                  
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
