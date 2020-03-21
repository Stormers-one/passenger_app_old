import 'package:flutter/material.dart';
// import 'package:o_k/shared/drawer.dart';

class Users_Count extends StatelessWidget {
  final busList = new Authservice();

  @override
  Widget build(BuildContext context) {
    void _showSettengsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Users>>.value(
      value: DatabaseService().users,
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
          body: UserList(),
        ),
      ),
    );
  }
}

class Buses {
  final String time;
  final String route;
  final String bustype;
  Users({this.time, this.route, this.bustype});
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
             leading: Image.asset(
                      'assets/profile-icon.png',
                    ), 
            //  CircleAvatar(
            //    radius: 50.0,
            //    backgroundColor: Colors.red[300],
            //  ),
            title: Text(bus.time),
          ),
        ));
  }
}

