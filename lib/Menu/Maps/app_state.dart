import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:o_k/shared/colors.dart';
import '../../services/googlemapservice.dart';

class AppState with ChangeNotifier {
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  bool locationServiceActive = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapController _mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();

// Map access Split START
  // bool get tracking => _tracking;
  // set tracking(bool track) => _tracking;
  // static bool _tracking;
// Map access Split END

// Distance START
  static String _distance;
  static String _duration;
  String get distance => _distance;
  String get duration => _duration;
// Distance END

  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;

  AppState() {
    // _getUserLocation();
    _loadingInitialPosition();
  }

  // ! TO CREATE ROUTE
  void sendRequest(String fromLocation, String toLocation) async {
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
    _markers.clear();
    _addMarker(start, fromLocation);
    _addMarker(destination, toLocation);
    String route =
        await _googleMapsServices.getRouteCoordinates(start, destination);
    createRoute(route);
    _distance = await _googleMapsServices.getTravelDistance(start, destination);
    _duration = await _googleMapsServices.getTravelDuration(start, destination);
    _initialPosition = start;
    notifyListeners();
  }

  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
        markerId: MarkerId(address.toString()),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: BitmapDescriptor.defaultMarker));
    notifyListeners();
  }

  void createRoute(String encondedPoly) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(_initialPosition.toString()),
        width: 7,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: red));
    // notifyListeners();
  }

  // ! CREATE LAGLNG LIST
  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  // !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  // ! ON CAMERA MOVE
  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
    notifyListeners();
  }

  // ! ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

//  LOADING INITIAL POSITION
  void _loadingInitialPosition() async {
    await Future.delayed(Duration(seconds: 5)).then((v) {
      if (_initialPosition == null) {
        locationServiceActive = false;
        notifyListeners();
      }
    });
  }
}
