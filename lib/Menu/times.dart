import 'package:flutter/material.dart';
import 'package:o_k/shared/drawer.dart';

class BusAvail extends StatelessWidget {
  final List<String> busList = <String>[
    'Pullikkanam - Kottayam (via Vagamon - Erattupetta)',
    'Chovoor - Alappuzha (via Pala - Changanassery)',
    'Erattupetta - Kottayam (via Pala)',
    'Poonjar - Kottayam (via Erattupetta - Pala',
    'Monkompu - Kottayam (via Erattupetta - Pala)',
    'Mundakkayam - Kottayam (via Chennad - Pala)',
    'Poonjar - Kottayam (via Erattupetta - Pala)',
    'Kalathwa - Kottayam (via Erattupetta - Pala)',
    'Mundakkayam - Kottayam (via Poonjar - Pala)',
    'Poonjar - Kottayam (via Erattupetta - Pala)',
    ];
List<String> time = [
  '8:15 am',
  '8:30am',
  '8:50 am',
  '9:00 am',
  '9:15 am',
  '9:15 am',
  '9:25 am',
  '9:45 am',
  '11:00 am',
  '11:25 am',
];

  @override
  Widget build(BuildContext context) {
    void _showSettengsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              
            );
          });
    }

    return <List<Buses>>.value(
      value: buses,
      child: MaterialApp(
        title: 'Homepage',
        home: Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
              title: Text('Users List'),
              backgroundColor: Colors.red[500],
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => _showSettengsPanel(),
                    icon: Icon(Icons.settings),
                    label: Text('Edit Profile'))
              ]),
          drawer: DrawerBuild(),
          body: BusList(),
        ),
      ),
    );
  }
}

class Buses {
  final String time;
  final String route;
  Buses({this.time, this.route});
}

class BusList extends StatefulWidget {
  @override
  _BusListState createState() => _BusListState();
}
class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    final buses = Provider.of<List<Buses>>(context) ?? [];
    //users.forEach((user) {
    //  print(user.fname);
    //  print(user.email);
    //  print(user.phno);
    //});
    return ListView.builder(
      itemCount: buses.length,
      itemBuilder: (context, index) {
        return BusesTile(bus: buses[index]);
      },
    );
  }
}
class BusesTile extends StatelessWidget {
  final Buses bus;
  BusesTile({this.bus});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
          color: Colors.orange[200],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Text(bus.time),
            title: Text(bus.route),
          ),
        ));
  }
}

