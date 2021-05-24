import 'package:flutter/material.dart';
import 'package:o_k/shared/Styling/buttonStyles.dart';
import 'package:o_k/shared/Styling/colors.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:o_k/shared/constants.dart';

List<String> devs = [
  'Anandu R',
  'Afthab Nihar',
  'Aishwarya Michael',
  'Rachel Kunjumon',
  'Smitha John',
  'Kennith Philips'
];
Color factColor = Colors.orange[200];
Color factBoxColor = bgOrange;
Color helpBoxColor = bgOrange;
Color helpColor = Colors.orange[200];

var _reportType = "";
var selectedReport = "";

final List<String> reportType = <String>[
  'Breakdown',
  'Protest on route',
  'Road inaccessible',
  'Road Accident'
];

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Help',
      home: Scaffold(
        backgroundColor: bgColor,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: red,
        //   title: Text('Help'),
        // ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  // constraints: BoxConstraints.expand(),
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  // height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: helpBoxColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                new DropdownButtonFormField(
                                  hint: Text(
                                    'Select a report',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  value: _reportType.isNotEmpty
                                      ? _reportType
                                      : null,
                                  items: reportType
                                      .map((value) => new DropdownMenuItem(
                                            value: value,
                                            child: Text('$value'),
                                          ))
                                      .toList(),
                                  isExpanded: true,
                                  onChanged: (val) => (() {
                                    _reportType = val;
                                    selectedReport = val;
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  }),
                                  decoration: textInputDecorationNoHint(),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () async {
                                Fluttertoast.showToast(msg: "Report Sent!");
                              },
                              child: const Text('Proceed',
                                  style: TextStyle(fontSize: 20)),
                              style: raisedButtonStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: helpBoxColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text('Help',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: helpColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Text('Helpline No.',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Quicksand-SemiBold')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: helpColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Text('KeralaRTC Hub',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Quicksand-SemiBold')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: factBoxColor),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 10),
                            Container(
                              child: Text('Facts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: factColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Maps',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'The user can input To and From locations to find the distance and duration of travel between the two locations along with the fastest route. More information such as bus timing and nearest bus stop will be added with further development',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: factColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Booking',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        ' The users can book tickets for a preferred bus type, during which the users are also made aware of the cost of their travel.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: factColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Tracking',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'With bus fleet number one can track the location of a bus. Since we do not have real-time coordinates of buses which can be tracked using google’s transport tracking api, there was no practical way to demonstrate this.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: factColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Timing',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'The user inputs To, From locations, along with type of bus and time of travel to obtain a comprehensive list of bus timings. Presently we do not have access to the state transport bus schedule therefore the app fetches this information by querying “Aanavandi” website.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: factColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'My Booking',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        '“My Bookings” section in the drawer allows the users to view all their current bookings.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                          ]),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
