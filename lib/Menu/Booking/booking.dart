import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/confirmation.dart';
import 'package:o_k/shared/busSearch.dart';
import '../../shared/colors.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import '../Maps/googlemapservice.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../shared/loading.dart';


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
  bool clickStatbooking = false;

  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  static String _distance;
  static String _duration;
  String get distance => _distance;
  String get duration => _duration;

  // Future<Null> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2020, 2),
  //       lastDate: DateTime(2020, 6));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //       _controller2.text = formatter.format(selectedDate);
  //     });
  // }

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
  bool loading = false;

  @override
  void initState() {
    _controller = new TextEditingController();
    _controller1 = new TextEditingController();
    _controller2 = new TextEditingController();
    super.initState();
  }

  double distance_;
  @override
  void dispose() {
    _controller?.dispose();
    _controller1?.dispose();
    _controller2?.dispose();
    super.dispose();
  }

   Future travel(String fromLocation, String toLocation) async {
    fromLocation = fromLocation + ', Kerala';
    toLocation = toLocation + ', Kerala';
    List<Placemark> placemark1 =
        await Geolocator().placemarkFromAddress(fromLocation);
    print(placemark1);
    List<Placemark> placemark2 =
        await Geolocator().placemarkFromAddress(toLocation);
    print(placemark2);
    double latitude1 = placemark1[0].position.latitude;
    double longitude1 = placemark1[0].position.longitude;
    double latitude2 = placemark2[0].position.latitude;
    double longitude2 = placemark2[0].position.longitude;
    LatLng start = LatLng(latitude1, longitude1);
    LatLng destination = LatLng(latitude2, longitude2);
    _distance = await _googleMapsServices.getTravelDistance(start, destination);
    // _duration = await _googleMapsServices.getTravelDuration(start, destination);
    String dist = _distance;
    dist = dist.substring(0, dist.length - 3);
    print(_distance);
    print(dist);
    distance_ = double.parse(dist);
    distancing(distance_);
  }

  bool clickStatBooking = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Booking',
      home: loading?Loading():Scaffold(
              backgroundColor: Colors.orange[100],
              appBar: AppBar(
                elevation: 0,
                title: Text('Booking'),
                backgroundColor: red,
              ),
              drawer: DrawerBuild(),
              body: SafeArea(
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
                                              delegate: BusSearch(
                                                  "BFrom", _controller));
                                        },
                                        decoration: textInputDecoration("From"),
                                        keyboardType: TextInputType.emailAddress,
                                        cursorWidth: 0,
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
                                          style:
                                              new TextStyle(color: Colors.black),
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            showSearch(
                                                context: context,
                                                delegate: BusSearch(
                                                    "BTo", _controller1));
                                          },
                                          decoration: textInputDecoration("To"),
                                          obscureText: false,
                                          keyboardType: TextInputType.text,
                                          cursorWidth: 0,
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
                                          },
                                          ),
                                      new Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
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
                                          selectedBookingBusType = val;
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        }),
                                        decoration: textInputDecorationNoHint(),
                                        validator: (value) {
                                          if (value == null && clickStatBooking) {
                                            return "Select The Bus Type";
                                          }
                                          else{
                                            return null;
                                          }
                                        },
                                      ),
                                      new Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 200,
                                        child: RaisedButton(
                                          onPressed: () async  {
                                            loading=true;
                                            await travel(selectedBookingFrom,
                                                selectedBookingTo);
                                            loading = false;
                                            fare = getFare(
                                                _currentBusType, distance_);
                                            clickStatBooking = true;
                                            if (_formkey.currentState
                                                .validate()) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingConfirm()));
                                            }
                                          },
                                          child: const Text('Proceed',
                                              style: TextStyle(fontSize: 20)),
                                          color: red,
                                          textColor: Colors.white,
                                          splashColor: Colors.grey,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Colors.transparent),
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
