import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class MapView extends StatefulWidget {
  @override
  _MapView createState() => _MapView();
}

class _MapView extends State<MapView> {
  @override 
  return new MapboxOverlay(
  controller: new MapboxOverlayController(),
  options: new MapboxMapOptions(
    style: Style.dark,
    camera: new CameraPosition(
      target: new LatLng(lat: 52.376316, lng: 4.897801),
      zoom: 15.0,
      bearing: 0.0,
      tilt: 0.0),
    ),
  );
}