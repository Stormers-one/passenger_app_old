// import '../Maps/distance.java';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
const apiKey = 'AIzaSyDPPxxRJaJEYiYRZjSS5TMwfMtx_q490l8';


class GoogleMapsServices{
    Future<String> getRouteCoordinates(LatLng l1, LatLng l2)async{
      String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
      http.Response response = await http.get(url);
      Map values = jsonDecode(response.body);
      print("Values Variable : $values");
      return values["routes"][0]["overview_polyline"]["points"]??'';
    }
}