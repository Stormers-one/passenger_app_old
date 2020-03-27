import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/Ticket.dart';
import 'package:o_k/shared/busSearch.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  String _currentBusType = "";
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
    return MaterialApp(
      title: 'Booking',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
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
                                controller: _controller,
                                style: new TextStyle(color: Colors.black),
                                onTap:(){     
                                FocusScope.of(context).requestFocus(FocusNode());                            
                                showSearch(context: context, delegate:BusSearch("BFrom",_controller));
                              },
                                decoration: textInputDecoration("From"),
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                              ),
                              new TextFormField(
                                controller: _controller1,
                                style: new TextStyle(color: Colors.black),
                                onTap:(){              
                                  FocusScope.of(context).requestFocus(FocusNode());                   
                                showSearch(context: context, delegate:BusSearch("BTo",_controller1));
                              },
                                autofocus: false,
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
                                padding: const EdgeInsets.only(top: 30.0),
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Ticket()
                                    ));
                                  },
                                  child: const Text('Proceed To Payment',
                                      style: TextStyle(fontSize: 18)),
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
