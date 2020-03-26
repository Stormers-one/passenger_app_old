library mapbox_gl;
import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'src/controller.dart';
part 'src/flutter_mapbox_view.dart';
part 'src/camera.dart';
part 'src/models.dart';

// class MapView extends StatefulWidget {
//   @override
//   _MapView createState() => _MapView();
// }

// class _MapView extends State<MapView> {
//   final CameraPosition _kInitialPosition;
//   final CameraTargetBounds _cameraTargetBounds;
//   static double defaultZoom = 12.0;

//   CameraPosition _position;
//   MapboxMapController mapController;
//   bool _isMoving = false;
//   bool _compassEnabled = true;
//   MinMaxZoomPreference _minMaxZoomPreference =
//       const MinMaxZoomPreference(12.0, 18.0);
//   String _styleString = "mapbox://styles/mapbox/streets-v8";
//   bool _rotateGesturesEnabled = true;
//   bool _scrollGesturesEnabled = true;
//   bool _tiltGesturesEnabled = false;
//   bool _zoomGesturesEnabled = true;
//   bool _myLocationEnabled = false;
//   MyLocationTrackingMode _myLocationTrackingMode = MyLocationTrackingMode.None;

//   _MapView._(
//       this._kInitialPosition, this._position, this._cameraTargetBounds);

//   static CameraPosition _getCameraPosition() {
//     final latLng = LatLng(40.7864, 0.2065);
//     return CameraPosition(
//       target: latLng,
//       zoom: defaultZoom,
//     );
//   }

//   factory _MapView() {
//     CameraPosition cameraPosition = _getCameraPosition();

//     // final cityBounds = LatLngBounds(
//     //   southwest: LatLng(40.7413, -119.267),
//     //   northeast: LatLng(40.8365, -119.1465),
//     // );

//     return _MapView._(
//         cameraPosition, cameraPosition, CameraTargetBounds(cityBounds));
//     // return _MapView._(
//     //     cameraPosition, cameraPosition, CameraTargetBounds(cityBounds));
//   }

//   void _onMapChanged() {
//     setState(() {
//       _extractMapInfo();
//     });
//   }

//   @override
//   void dispose() {
//     if (mapController != null) {
//       mapController.removeListener(_onMapChanged);
//     }
//     super.dispose();
//   }

//   void _extractMapInfo() {
//     _position = mapController.cameraPosition;
//     _isMoving = mapController.isCameraMoving;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _buildMapBox(context),
//     );
//   }

//   MapboxMap _buildMapBox(BuildContext context) {
//     return MapboxMap(
//         onMapCreated: onMapCreated,
//         initialCameraPosition: this._kInitialPosition,
//         trackCameraPosition: true,
//         compassEnabled: _compassEnabled,
//         cameraTargetBounds: _cameraTargetBounds,
//         minMaxZoomPreference: _minMaxZoomPreference,
//         styleString: _styleString,
//         rotateGesturesEnabled: _rotateGesturesEnabled,
//         scrollGesturesEnabled: _scrollGesturesEnabled,
//         tiltGesturesEnabled: _tiltGesturesEnabled,
//         zoomGesturesEnabled: _zoomGesturesEnabled,
//         myLocationEnabled: _myLocationEnabled,
//         myLocationTrackingMode: _myLocationTrackingMode,
//         onCameraTrackingDismissed: () {
//           this.setState(() {
//             _myLocationTrackingMode = MyLocationTrackingMode.None;
//           });
//         });
//   }

//   void onMapCreated(MapboxMapController controller) {
//     mapController = controller;
//     mapController.addListener(_onMapChanged);
//     _extractMapInfo();
//     setState(() {});
//   }
// }
