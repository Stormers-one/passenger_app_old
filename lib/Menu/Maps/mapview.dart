// Kerala City limits :
// southwest: LatLng(7.962818, 74.949406),
// northeast: LatLng(11.879561, 77.688881),

library mapbox_gl;

import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';

// class MapView extends StatefulWidget {
//   @override
//   _MapView createState() => _MapView();
// }

// class _MapView extends State<MapView> {
//   GoogleMapController mapController;
//   LatLng _center;
//   Position currentLocation;
//   CameraPosition _position;
//   @override
//   void initState() {
//     super.initState();
//     getUserLocation();
//   }

//   Future<Position> locateUser() async {
//     return Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }

//   getUserLocation() async {
//     currentLocation = await locateUser();
//     setState(() {
//       _center = LatLng(currentLocation.latitude, currentLocation.longitude);
//     });
//     print('center $_center');
//   }

//   // final LatLng _center = const LatLng(45, 0);
//   // LatLng pos;
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   final Map<String, Marker> _markers = {};
//   void _getLocation() async {
//     var currentLocation = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

//     setState(() {
//       _markers.clear();
//       final marker = Marker(
//         markerId: MarkerId("curr_loc"),
//         position: LatLng(currentLocation.latitude, currentLocation.longitude),
//         infoWindow: InfoWindow(title: 'Your Location'),
//       );
//       _markers["Current Location"] = marker;
//     });
//   }

//   void _updateCameraPosition(CameraPosition position) {
//     setState(() {
//       _position = position;
//     });
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // appBar: AppBar(elevation: 0,
//         // backgroundColor: bgOrange,
//         // title: Text('Bus Routes'),
//         // ),
//         body: Column(
//           children: <Widget>[
//             Flexible(
//               flex: 3,
//               child: Stack(
//                 children: <Widget>[
//                   new MapboxOverlay(
//                     controller: new MapboxOverlayController(),
//                     options: new MapboxMapOptions(
//                       style: Style.dark,
//                       camera: new CameraPosition(
//                           target: _center, zoom: 15.0, bearing: 0.0, tilt: 0.0),
//                     ),
//                   ),
//                   Container(),
//                 ],
//               ),
//             ),
//             Flexible(
//                 flex: 2,
//                 child: Container(
//                   decoration: new BoxDecoration(
//                     color: bgOrange,
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // part 'src/controller.dart';
// // part 'src/flutter_mapbox_view.dart';
// // part 'src/camera.dart';
// part 'src/models.dart';

class MapView extends StatefulWidget {
  @override
  _MapView createState() => _MapView();
}

class _MapView extends State<MapView> {
  final CameraPosition _kInitialPosition;
  final CameraTargetBounds _cameraTargetBounds;
  static double defaultZoom = 10.0;

  CameraPosition _position;
  MapboxMapController mapController;
  bool _isMoving = false;
  bool _compassEnabled = true;
  MinMaxZoomPreference _minMaxZoomPreference =
      const MinMaxZoomPreference(8.0, 18.0);
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
    final latLng = LatLng(9.959624, 76.335317);
    return CameraPosition(
      target: latLng,
      zoom: defaultZoom,
    );
  }

  factory _MapView() {
    CameraPosition cameraPosition = _getCameraPosition();

    final cityBounds = LatLngBounds(
      southwest: LatLng(7.962818, 74.949406),
      northeast: LatLng(11.879561, 77.688881),
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
