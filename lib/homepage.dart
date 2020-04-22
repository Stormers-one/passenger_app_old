import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:o_k/Wrapper.dart';
import 'package:o_k/conductor/conductor.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/shared/background_login.dart';
// import 'package:o_k/shared/bottomBar.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'homepageButtons/data.dart';
import 'homepageButtons/button.dart';

class Homepage extends StatefulWidget {
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
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      debugShowCheckedModeBanner: false,
      title: 'Homepage',
      home: Scaffold(
        backgroundColor: bgOrange,
        appBar: AppBar(
            elevation: 0,
            //title: Text('MENU'),
            backgroundColor: red,
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: DoubleBackToCloseApp(
            snackBar: const SnackBar(
                content: Text(
              'Press Back Again To Exit',
              textAlign: TextAlign.center,
            )),
            child: SafeArea(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    // Container(alignment: Alignment(0, 1), child: WavyFooter()),
                    ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Conductor()),
                                );
                              },
                            ),
                            Hero(
                              tag: 'imageHero',
                              child: new Container(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                ),
                                height: 190,
                                width: 190,
                              ),
                            ),
                            Container(
                              // decoration: BoxDecoration(
                              //   color: bgOrange,
                              //   shape: BoxShape.rectangle,
                              //   borderRadius: new BorderRadius.all(
                              //      const Radius.circular(25.0),
                              //       ),
                              // ),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              width: MediaQuery.of(context).size.width,
                              //height:
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Button(
                                        image: buttonHome[0].image,
                                        text: buttonHome[0].text,
                                        route: buttonHome[0].route,
                                        context: context,
                                      ),
                                      Button(
                                        image: buttonHome[1].image,
                                        text: buttonHome[1].text,
                                        route: buttonHome[1].route,
                                        context: context,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Button(
                                        image: buttonHome[2].image,
                                        text: buttonHome[2].text,
                                        route: buttonHome[2].route,
                                        context: context,
                                      ),
                                      Button(
                                        image: buttonHome[3].image,
                                        text: buttonHome[3].text,
                                        route: buttonHome[3].route,
                                        context: context,
                                      ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
