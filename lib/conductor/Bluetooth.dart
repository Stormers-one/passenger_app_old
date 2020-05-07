import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/colors.dart';
import 'package:flutter_blue/flutter_blue.dart';


class Bluetooth extends StatefulWidget{
  Bluetooth({Key key,this.title}) : super(key:key);
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final String title;
  @override
  _BluetoothState createState() => _BluetoothState();
}
class _BluetoothState extends State<Bluetooth> {
  @override 
  void initState() {
   super.initState();
   widget.flutterBlue.connectedDevices
       .asStream()
       .listen((List<BluetoothDevice> devices) {
     for (BluetoothDevice device in devices) {
       _addDeviceTolist(device);
     }
   });
   widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
     for (ScanResult result in results) {
       _addDeviceTolist(result.device);
     }
   });
   widget.flutterBlue.startScan();
 }

 ListView _buildListViewOfDevices() {
   List<Container> containers = new List<Container>();
   for (BluetoothDevice device in widget.devicesList) {
     containers.add(
       Container(
         height: 50,
         child: Row(
           children: <Widget>[
             Expanded(
               child: Column(
                 children: <Widget>[
                   Text(device.name == '' ? '(unknown device)' : device.name),
                   Text(device.id.toString()),
                 ],
               ),
             ),
             FlatButton(
               color: Colors.blue,
               child: Text(
                 'Connect',
                 style: TextStyle(color: Colors.white),
               ),
               onPressed: () {},
             ),
           ],
         ),
       ),
     );
   }
 
   return ListView(
     padding: const EdgeInsets.all(8),
     children: <Widget>[
       ...containers,
     ],
   );
 }

  _addDeviceTolist(final BluetoothDevice device) {
   if (!widget.devicesList.contains(device)) {
     setState(() {
       widget.devicesList.add(device);
     });
   }
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Bluetooth',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('Bluetooth'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  _buildListViewOfDevices()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
