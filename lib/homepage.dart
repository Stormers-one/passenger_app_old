import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:o_k/Wrapper.dart';
import 'package:o_k/services/auth.dart';
<<<<<<< HEAD
=======
import 'package:o_k/Menu/Booking/booking.dart';
import 'package:o_k/Menu/help.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/Menu/Timing/timing.dart';
import 'package:o_k/Menu/Tracking/tracking.dart';
import 'package:o_k/Menu/Maps/maps.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';
>>>>>>> 75f2771fbad32d4793c807903d9bcd1a7f93a899
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'homepageButtons/data.dart';
import 'homepageButtons/button.dart';

class Homepage extends StatefulWidget{
  // Homepage({Key key}) : super(key: key);
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  final Authservice _auth = new Authservice();
  final buttonHome = Buttons.fetchAll() ?? [];
  @override
  Widget build(BuildContext context) {
    // Future<bool> _onBackPressed() {
    //   return showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             title: Text("Exit: Are you sure?"),
    //             actions: <Widget>[
    //               FlatButton(
    //                   onPressed: () => Navigator.pop(context, false),
    //                   child: Text("NO")),
    //               FlatButton(
    //                 onPressed: () => Navigator.pop(context, exit(0)),
    //                 child: Text("YES"),
    //               ),
    //             ],
    //           ));
    // }
    return MaterialApp(
      title: 'Homepage',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
            //title: Text('MENU'),
            backgroundColor: Colors.red[500],
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  clickStatLogin = false;
                  clickStatRegister = false;
                  await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wrapper()),
                  );
                },
              )
            ]),
        drawer: DrawerBuild(),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
              content: Text(
            'Press Back Again To Exit',
            textAlign: TextAlign.center,
          )),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'imageHero',
                    child: new Container(
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.rectangle,
                      /*borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0))*/
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    //height:
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(image: buttonHome[0].image,text: buttonHome[0].text,route: buttonHome[0].route,context: context,),
                            Button(image: buttonHome[1].image,text: buttonHome[1].text,route: buttonHome[1].route,context: context,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(image: buttonHome[2].image,text: buttonHome[2].text,route: buttonHome[2].route,context: context,),
                            Button(image: buttonHome[3].image,text: buttonHome[3].text,route: buttonHome[3].route,context: context,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                //overflow: Overflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
