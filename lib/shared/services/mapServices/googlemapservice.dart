// import '../Maps/distance.java';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:o_k/privateConfig.dart';

const apiKey = Constants.GoogleServices_api_key;

class GoogleMapsServices {
  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    Uri url = Uri.https("maps.googleapis.com", "/maps/api/directions/json", {
      "origin": "${l1.latitude},${l1.longitude}",
      "destination": "${l2.latitude},${l2.longitude}",
      "key": apiKey
    });
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    // print("Values Variable : $values");
    return values["routes"][0]["overview_polyline"]["points"] ?? '';
  }

  Future<String> getTravelInfo(LatLng l1, LatLng l2, int option) async {
    Uri url =
        Uri.https("maps.googleapis.com", "/maps/api/distancematrix/json", {
      "units": "metric",
      "origins": "${l1.latitude},${l1.longitude}",
      "destinations": "${l2.latitude},${l2.longitude}",
      "key": apiKey
    });
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    // print("Values Variable : $values");
    if (option == 1) {
      return values["rows"][0]["elements"][0]["distance"]["text"] ?? "";
    } else if (option == 2) {
      return values["rows"][0]["elements"][0]["duration"]["text"] ?? "";
    }
  }
}
