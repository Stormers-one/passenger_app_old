import 'package:flutter/material.dart';
// import 'package:o_k/shared/bottomBar.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/drawer.dart';
import '../ConductorpageButtons/data.dart';
import '../ConductorpageButtons/button.dart';

class Conductor extends StatefulWidget {
  // Homepage({Key key}) : super(key: key);
  State<StatefulWidget> createState() {
    return _ConductorState();
  }
}

class _ConductorState extends State<Conductor> {
  final buttonHome = Buttons.fetchAll() ?? [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      debugShowCheckedModeBanner: false,
      title: 'Conductors',
      home: Scaffold(
        backgroundColor: bgOrange,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Center(
              child: Stack(
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: 'imageHero',
                            child: new Container(
                              child: Image.asset(
                                'assets/images/logo.png',
                              ),
                              height: 125,
                              width: 125,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            width: MediaQuery.of(context).size.width,
                            //height:
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                                Button(
                                  image: buttonHome[0].image,
                                  text: buttonHome[0].text,
                                  route: buttonHome[0].route,
                                  context: context,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                                Button(
                                  image: buttonHome[1].image,
                                  text: buttonHome[1].text,
                                  route: buttonHome[1].route,
                                  context: context,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                                Button(
                                  image: buttonHome[2].image,
                                  text: buttonHome[2].text,
                                  route: buttonHome[2].route,
                                  context: context,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                                Button(
                                  image: buttonHome[3].image,
                                  text: buttonHome[3].text,
                                  route: buttonHome[3].route,
                                  context: context,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
