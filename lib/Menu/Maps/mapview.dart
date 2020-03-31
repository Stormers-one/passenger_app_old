// Kerala City limits :
// southwest: LatLng(7.962818, 74.949406),
// northeast: LatLng(11.879561, 77.688881),

import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import '../Maps/distance.java';
import 'googlemapservice.dart';
import 'app_state.dart';

class MapHome extends StatefulWidget {
  MapHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MapHome createState() => _MapHome();
}

class _MapHome extends State<MapHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MapView());
  }
}

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

  getUserLocation() async {
    currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);

      loading = false;
    });
    print('center $_center');
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  final Map<String, Marker> _marker = {};
  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }
  //PolyLines

  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return MaterialApp(
      home: appState.initialPosition == null
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
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: appState.initialPosition, zoom: 10.0),
                      onMapCreated: appState.onCreated,
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      compassEnabled: true,
                      markers: appState.markers,
                      onCameraMove: appState.onCameraMove,
                      polylines: appState.polyLines,
                    ),
                    Container(
                      alignment: Alignment(0, -0.5),
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        selectedMapsFrom,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
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
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        selectedMapsTo,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
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
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        appState.distance,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
