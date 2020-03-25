import 'package:flutter/material.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:livemap/livemap.dart';
import 'package:latlong/latlong.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child: FlutterMap(
            options: new MapOptions(
              center: LatLng(21.843,82.795),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/aquaregis32/ck8720wdg0jk01illhroi1ogg/wmts?access_token=pk.eyJ1IjoiYXF1YXJlZ2lzMzIiLCJhIjoiY2s4NzFoYzBlMDQ5ZjNkbnljcnV4eTltayJ9.lxboNewyE7gaLHPQ4lFGtw",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiYXF1YXJlZ2lzMzIiLCJhIjoiY2s4NzFoYzBlMDQ5ZjNkbnljcnV4eTltayJ9.lxboNewyE7gaLHPQ4lFGtw',
                    'id': 'mapbox.mapbox-streets-v8',
                  }),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(21.843,82.795),
                    builder: (ctx) => new Container(
                      child: new FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
