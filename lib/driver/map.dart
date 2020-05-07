// Kerala City limits :
// southwest: LatLng(7.962818, 74.949406),
// northeast: LatLng(11.879561, 77.688881),

import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../shared/constants.dart';
import '../shared/loading.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import '../Maps/distance.java';
// import 'googlemapservice.dart';
import 'drive_state.dart';

class DriverMap extends StatefulWidget {
  @override
  _DriverMap createState() => _DriverMap();
}

class _DriverMap extends State<DriverMap> {
  
  GoogleMapController mapController;
  LatLng _center;
  var bus1 = LatLng(10.004855, 76.312934);
  var bus2 = LatLng(9.997830, 76.314024);
  Position currentLocation;
  CameraPosition _position;

  bool loading = true;

  TextEditingController _controllerFrom;
  TextEditingController _controllerTo;
  TextEditingController stateController;

  @override
  void initState() {
    _controllerFrom = new TextEditingController();
    _controllerTo = new TextEditingController();
    stateController = new TextEditingController();
    super.initState();
    loading = true;
    getUserLocation();
  }

  @override
  void dispose() {
    _controllerFrom?.dispose();
    _controllerTo?.dispose();
    super.dispose();
  }

  getUserLocation() async {
    currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);

      loading = false;
    });
    print('center $_center');
  }
  void calcDistanceBetweenMarkers(){

  }

  Widget build(BuildContext context) {
    final driveState = Provider.of<DriveState>(context);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      home: 
      driveState.initialPosition == null
          ? Loading()
          : 
          Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: red,
                title: Text('Buses'),
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: bus1, zoom: 10.0),
                        onMapCreated: driveState.onCreated,
                        // myLocationEnabled: true,
                        mapType: MapType.normal,
                        compassEnabled: true,
                        markers: Set<Marker>.of(
                          <Marker>[
                            Marker(
                                onTap: () {
                                  print('Bus 1');
                                },
                                draggable: true,
                                markerId: MarkerId('Bus 1'),
                                position:
                                    LatLng(bus1.latitude, bus1.longitude),
                                onDragEnd: ((value) {
                                  print(value.latitude);
                                  print(value.longitude);
                                  bus1 = LatLng(value.latitude, value.longitude);
                                  driveState.sendRequest(bus1, bus2);
                                })),
                            Marker(
                                onTap: () {
                                  print('Bus 2');
                                },
                                draggable: true,
                                markerId: MarkerId('Bus 2'),
                                position:
                                    LatLng(bus2.latitude, bus2.longitude),
                                onDragEnd: ((value) {
                                  print(value.latitude);
                                  print(value.longitude);
                                  bus2 = LatLng(value.latitude, value.longitude);
                                  driveState.sendRequest(bus1, bus2);
                                }))
                          ],
                        ),
                        onCameraMove: driveState.onCameraMove,
                        polylines: driveState.polyLines,
                      ),
                      Container(
                        alignment: Alignment(0, -0.5),
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                // padding: const EdgeInsets.all(20),
                                height: 54,
                                decoration: BoxDecoration(
                                  color: driveState.indicatorColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: driveState.indicatorColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 8),
                                  Container(
                                    height: 54,
                                    // padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: salmonColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(20),
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: red,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Text(
                                            'Distance: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              driveState.distance,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 54,
                                    // padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: salmonColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(20),
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: red,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Text(
                                            'Duration: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              driveState.duration,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
