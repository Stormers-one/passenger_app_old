import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/drawer.dart';

List<String> devs = [
  'Anandu R',
  'Afthab Nihar',
  'Aishwarya Michael',
  'Rachel Kunjumon',
  'Smitha John',
  'Kennith Philips'
];

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[500],
          title: Text('Help'),
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  // constraints: BoxConstraints.expand(),
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: coralColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Helpline No.',
                                style: TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: Text('KeralaRTC Hub',
                                style: TextStyle(fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: salmonColor
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('Facts',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(height:10),

                            SizedBox(height:10),
                            Container(
                              child: Text('Maps',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(height:10),
                            
                            SizedBox(height:10),
                            Container(
                              child: Text('Booking',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(height:10),
                            
                            SizedBox(height:10),
                            Container(
                              child: Text('Tracking',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(height:10),
                            
                            SizedBox(height:10),
                            Container(
                              child: Text('Timing',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                          ]),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
