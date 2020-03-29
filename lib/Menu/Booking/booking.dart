import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/confirmation.dart';
import 'package:o_k/shared/busSearch.dart';
import '../../shared/colors.dart';
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
  TextEditingController _controller2;
  final _formkey = GlobalKey<FormState>();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 2),
        lastDate: DateTime(2020, 6));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _controller2.text = formatter.format(selectedDate);
      });
  }

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
    _controller2 = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller1?.dispose();
    _controller2?.dispose();
    super.dispose();
  }

  bool clickStatBooking = false;

  getFare(String busT) {
    if (km <= 5) {
      return (minFare[busT]).ceil();
    } else {
      return (minFare[busT] + (km - 5) * perKmFare[busT]).ceil();
    }
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
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    showSearch(
                                        context: context,
                                        delegate:
                                            BusSearch("BFrom", _controller));
                                  },
                                  decoration: textInputDecoration("From"),
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  validator: (val) =>
                                      val.isEmpty && clickStatBooking
                                          ? 'This is required'
                                          : null,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                                new TextFormField(
                                    controller: _controller1,
                                    style: new TextStyle(color: Colors.black),
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showSearch(
                                          context: context,
                                          delegate:
                                              BusSearch("BTo", _controller1));
                                    },
                                    decoration: textInputDecoration("To"),
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    validator: (val) {
                                      if (val.isEmpty && clickStatBooking) {
                                        return 'This is requied';
                                      } else if (_controller.text ==
                                              _controller1.text &&
                                          _controller.text.isNotEmpty) {
                                        return 'Both location should not be same';
                                      } else {
                                        return null;
                                      }
                                    }),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                ),
                                // new TextFormField(
                                //   decoration:
                                //       textInputDecoration("Date Of Departure"),
                                //   keyboardType: TextInputType.emailAddress,
                                // ),
                                // Column(children: <Widget>[
                                //   Text('Date Of Departure'),
                                //   DateTimeField(
                                //     format: format,
                                //     onShowPicker: (context, currentValue) {
                                //       return showDatePicker(
                                //           context: context,
                                //           firstDate: DateTime(1900),
                                //           initialDate:
                                //               currentValue ?? DateTime.now(),
                                //           lastDate: DateTime(2100));
                                //     },
                                //   ),
                                // ]),
                                Container(
                                  child: TextFormField(
                                    controller: _controller2,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(color: Colors.black),
                                    onTap: () => _selectDate(context),
                                    decoration:
                                        textInputDecoration("Date Of Departure"),
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
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
      ),
    );
  }
}
