import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_k/shared/busSearch.dart';
import 'package:o_k/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:o_k/model/busStop.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';
import 'package:o_k/Menu/Timing/times.dart';

class Timing extends StatefulWidget {
  @override
  _Timing createState() => _Timing();
}
class _Timing extends State<Timing> {
  final Authservice _auth = new Authservice();
  final DatabaseService _service = new DatabaseService();
String _currentBusType = "";
String _currenttime = "";
var queryResult = [];
  var busStopName = [];
  int count = 0;
  DatabaseService res = new DatabaseService();
 TextEditingController _controller ;
 TextEditingController _controller1 ;

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
  @override
   void initState() {
      _controller = new TextEditingController();
      _controller1 = new TextEditingController();
      super.initState();
    }

 @override
  void dispose(){
   _controller?.dispose();
    _controller1?.dispose();
   super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BusStopData>>.value(
      value: DatabaseService().busStopData,
          child: MaterialApp(
          title: 'Bus Timing',
          home: Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        elevation: 0,
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
                              controller: _controller,
                              style: new TextStyle(color: Colors.black),
                              onTap:(){    
                                FocusScope.of(context).requestFocus(FocusNode());                             
                                showSearch(context: context, delegate:BusSearch("From",_controller));
                              },
                              decoration:textInputDecoration("From"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new TextFormField(
                              controller: _controller1,
                              style: new TextStyle(color: Colors.black),
                              onTap:(){
                                FocusScope.of(context).requestFocus(FocusNode()); 
                                showSearch(context: context, delegate: BusSearch("To",_controller1));
                              },
                              textCapitalization: TextCapitalization.characters,
                              decoration: textInputDecoration("To"),
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 30.0),
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