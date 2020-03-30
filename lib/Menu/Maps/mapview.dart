// Kerala City limits :
// southwest: LatLng(7.962818, 74.949406),
// northeast: LatLng(11.879561, 77.688881),

import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';

class MapView extends StatefulWidget {
  @override
  _MapView createState() => _MapView();
}

class _MapView extends State<MapView> {
  GoogleMapController mapController;
  LatLng _center;
  Position currentLocation;
  CameraPosition _position;

  bool loading = true;

  TextEditingController _controllerFrom;
  TextEditingController _controllerTo;

  @override
  void initState() {
    _controllerFrom = new TextEditingController();
    _controllerTo = new TextEditingController();
    super.initState();
    getUserLocation();
  }

  @override
  void dispose() {
    _controllerFrom?.dispose();
    _controllerTo?.dispose();
    super.dispose();
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      loading = false;
    });
    print('center $_center');
  }

  // final LatLng _center = const LatLng(45, 0);
  // LatLng pos;
  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  final Map<String, Marker> _markers = {};
  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["Current Location"] = marker;
    });
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Loading()
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: red,
                title: Text('Bus Routes'),
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Stack(
                        children: <Widget>[
                          GoogleMap(
                            onMapCreated: _onMapCreated,
                            myLocationEnabled: true,
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 11.0,
                            ),
                            compassEnabled: true,
                            onCameraMove: _updateCameraPosition,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            color: coralColor,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  // padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: salmonColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          'From: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        child: Text(
                                          selectedMapsFrom,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: salmonColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Text(
                                          'To: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        child: Text(
                                          selectedMapsTo,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: salmonColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      Container(
                                        child: Text(
                                          distanceBetween.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
    );
  }
}
