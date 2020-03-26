import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';

// class Map extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FlutterMap(
//         options: MapOptions(
//           center: LatLng(21.843,82.795),
//           zoom: 13.0,
//         ),
//         layers: [
//           TileLayerOptions(
//               urlTemplate:
//                   "https://api.mapbox.com/styles/v1/aquaregis32/ck8720wdg0jk01illhroi1ogg/wmts?access_token=pk.eyJ1IjoiYXF1YXJlZ2lzMzIiLCJhIjoiY2s4NzFoYzBlMDQ5ZjNkbnljcnV4eTltayJ9.lxboNewyE7gaLHPQ4lFGtw",
//               additionalOptions: {
//                 'accessToken':
//                     'pk.eyJ1IjoiYXF1YXJlZ2lzMzIiLCJhIjoiY2s4NzFoYzBlMDQ5ZjNkbnljcnV4eTltayJ9.lxboNewyE7gaLHPQ4lFGtw',
//                 'id': 'mapbox.mapbox-streets-v8',
//               }),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(21.843,82.795),
//                 builder: (context) => Container(
//                   height: 100,
//                   child: FlutterLogo(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Maps Sample App'),
        //   backgroundColor: Colors.green[700],
        // ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
