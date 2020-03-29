import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/confirmation.dart';
import 'package:o_k/shared/busSearch.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String _currentBusType = "";
  TextEditingController _controller;
  TextEditingController _controller1;
  final _formkey = GlobalKey<FormState>();
  bool clickStatbooking = false;

  final format = DateFormat("yyyy-MM-dd");
  final List<String> bustype = <String>[
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
  void dispose() {
    _controller?.dispose();
    _controller1?.dispose();
    super.dispose();
  }

  bool clickStatBooking = false;

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
                          key: _formkey,
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
                                validator: (val) => val.isEmpty && clickStatBooking
                                            ? 'This is required'
                                            : null,
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
                                decoration: textInputDecoration("To"),
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                validator: (val) { 
                                  if (val.isEmpty && clickStatBooking){
                                    return 'This is requied';
                                  }
                                  else if (_controller.text == _controller1.text && _controller.text.isNotEmpty){
                                    return 'Both location should not be same';
                                  }
                                  else{
                                    return null;
                                  }
                                }
                              ),
                              
                              // new Padding(
                              //   padding: const EdgeInsets.only(top: 30.0),
                              // ),
                              // new TextFormField(
                              //   decoration: textInputDecoration("Date Of Departure"),
                              //   keyboardType: TextInputType.emailAddress,
                              // ),
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
                              onChanged: (val) => setState(() { _currentBusType = val;}),
                              decoration: textInputDecorationNoHint(),
                              validator: (val) => val ==null && clickStatBooking
                                            ? 'This is required'
                                            : null,
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: () {
                                    clickStatBooking = true; 
                                    fare = getFare(_currentBusType);
                                    clickStatBooking = true;
                                    if(_formkey.currentState.validate()){
                                      Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => BookingConfirm()
                                    ));
                                    }
                                  },
                                ),
                              ),
                                FloatingActionButton(
                                  child: new Icon(Icons.date_range, color: salmonColor,),
                                  backgroundColor: red,
                                  onPressed: () => showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime.now()
                                        .subtract(new Duration(days: 1)),
                                    lastDate: new DateTime.now()
                                        .add(new Duration(days: 90)),
                                  ),
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                ),
                                new DropdownButtonFormField(
                                  hint: Text(
                                    'Bus Type',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  value: _currentBusType.isNotEmpty
                                      ? _currentBusType
                                      : null,
                                  items: bustype
                                      .map((value) => new DropdownMenuItem(
                                            value: value,
                                            child: Text('$value'),
                                          ))
                                      .toList(),
                                  isExpanded: true,
                                  onChanged: (val) => setState(() {
                                    _currentBusType = val;
                                  }),
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
                                      fare = getFare(_currentBusType);
                                      clickStatBooking = true;
                                      if (_formkey.currentState.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingConfirm()));
                                      }
                                    },
                                    child: const Text('Proceed',
                                        style: TextStyle(fontSize: 20)),
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    splashColor: Colors.grey,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side:
                                          BorderSide(color: Colors.transparent),
                                    ),
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
