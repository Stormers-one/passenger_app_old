import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:o_k/Menu/Booking/bookings_list.dart';
import 'package:o_k/Menu/help.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';
import 'package:o_k/homepage.dart';
import 'package:o_k/shared/underDevelopment.dart';
import 'package:o_k/shared/colors.dart';


class DrawerBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: red,
                  ),
                  child: Text(
                    'Odu Komban',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                ),
                /*ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Messages()),
                    );
                  },
                ),*/
                // ListTile(
                //   leading: Icon(Icons.account_circle),
                //   title: Text('Users List'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => UsersCount()),
                //     );
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Under Dev'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UnderDev()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(MdiIcons.ticket),
                  title: Text('My Bookings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingList()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.report),
                  title: Text('Report'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reports()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                ),
              ],
            ),
          );
  }
}