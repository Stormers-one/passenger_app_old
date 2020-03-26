import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:o_k/shared/colors.dart';
// import 'package:latlong/latlong.dart';
// import 'package:dio/dio.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView extends StatefulWidget {
  @override
  _MapView createState() => _MapView();
}

class _MapView extends State<MapView> {
  final CameraPosition _kInitialPosition;
  final CameraTargetBounds _cameraTargetBounds;
  static double defaultZoom = 12.0;

  CameraPosition _position;
  MapboxMapController mapController;
  bool _isMoving = false;
  bool _compassEnabled = true;
  MinMaxZoomPreference _minMaxZoomPreference =
      const MinMaxZoomPreference(12.0, 18.0);
  String _styleString = "mapbox://styles/mapbox/streets-v8";
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = false;
  bool _zoomGesturesEnabled = true;
  bool _myLocationEnabled = false;
  MyLocationTrackingMode _myLocationTrackingMode = MyLocationTrackingMode.None;

  _MapView._(
      this._kInitialPosition, this._position, this._cameraTargetBounds);

  static CameraPosition _getCameraPosition() {
    final latLng = LatLng(40.7864, -119.2065);
    return CameraPosition(
      target: latLng,
      zoom: defaultZoom,
    );
  }

  factory _MapView() {
    CameraPosition cameraPosition = _getCameraPosition();

    final cityBounds = LatLngBounds(
      southwest: LatLng(40.7413, -119.267),
      northeast: LatLng(40.8365, -119.1465),
    );

    return _MapView._(
        cameraPosition, cameraPosition, CameraTargetBounds(cityBounds));
  }

  void _onMapChanged() {
    setState(() {
      _extractMapInfo();
    });
  }

  @override
  void dispose() {
    if (mapController != null) {
      mapController.removeListener(_onMapChanged);
    }
    super.dispose();
  }

  void _extractMapInfo() {
    _position = mapController.cameraPosition;
    _isMoving = mapController.isCameraMoving;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildMapBox(context),
    );
  }

  MapboxMap _buildMapBox(BuildContext context) {
    return MapboxMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: this._kInitialPosition,
        trackCameraPosition: true,
        compassEnabled: _compassEnabled,
        cameraTargetBounds: _cameraTargetBounds,
        minMaxZoomPreference: _minMaxZoomPreference,
        styleString: _styleString,
        rotateGesturesEnabled: _rotateGesturesEnabled,
        scrollGesturesEnabled: _scrollGesturesEnabled,
        tiltGesturesEnabled: _tiltGesturesEnabled,
        zoomGesturesEnabled: _zoomGesturesEnabled,
        myLocationEnabled: _myLocationEnabled,
        myLocationTrackingMode: _myLocationTrackingMode,
        onCameraTrackingDismissed: () {
          this.setState(() {
            _myLocationTrackingMode = MyLocationTrackingMode.None;
          });
        });
  }

  void onMapCreated(MapboxMapController controller) {
    mapController = controller;
    mapController.addListener(_onMapChanged);
    _extractMapInfo();
    setState(() {});
  }
}




  // GoogleMapController mapController;
  // LatLng _center;
  // Position currentLocation;
  // CameraPosition _position;
  // @override
  // void initState() {
  //   super.initState();
  //   getUserLocation();
  // }

  // Future<Position> locateUser() async {
  //   return Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  // getUserLocation() async {
  //   currentLocation = await locateUser();
  //   setState(() {
  //     _center = LatLng(currentLocation.latitude, currentLocation.longitude);
  //   });
  //   print('center $_center');
  // }

  // // final LatLng _center = const LatLng(45, 0);
  // // LatLng pos;
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // final Map<String, Marker> _markers = {};
  // void _getLocation() async {
  //   var currentLocation = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

  //   setState(() {
  //     _markers.clear();
  //     final marker = Marker(
  //       markerId: MarkerId("curr_loc"),
  //       position: LatLng(currentLocation.latitude, currentLocation.longitude),
  //       infoWindow: InfoWindow(title: 'Your Location'),
  //     );
  //     _markers["Current Location"] = marker;
  //   });
  // }
  //   void _updateCameraPosition(CameraPosition position) {
  //   setState(() {
  //     _position = position;
  //   });
  // }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       // appBar: AppBar(elevation: 0,
  //       // backgroundColor: bgOrange,
  //       // title: Text('Bus Routes'),
  //       // ),
  //       body: Column(
  //         children: <Widget>[
  //           Flexible(
  //             flex: 3,
  //             child: Stack(
  //               children: <Widget>[
  //                 GoogleMap(
  //                   onMapCreated: _onMapCreated,  
  //                   myLocationEnabled: true,
  //                   mapType: MapType.normal,
  //                   initialCameraPosition: CameraPosition(
  //                     target: _center,
  //                     zoom: 11.0,
  //                   ),
  //                   compassEnabled: true,
  //                   onCameraMove: _updateCameraPosition,
  //                 ),
  //                 Container(
                    
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Flexible(
  //               flex: 2,
  //               child: Container(
  //                 decoration: new BoxDecoration(
  //                   color: bgOrange ,
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }
