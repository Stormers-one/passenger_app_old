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
      theme: ThemeData(fontFamily: 'Quicksand-Regular'),
      title: 'Help',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: red,
        //   title: Text('Help'),
        // ),
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
                  // height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: coralColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text('Help',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: salmonColor,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text('Helpline No.',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                          ), 
                          Card(
                            color: salmonColor,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text('KeralaRTC Hub',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: coralColor),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 10),
                            Container(
                              child: Text('Facts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: salmonColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Maps',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed scelerisque lorem, vitae volutpat augue. Nulla leo quam, dignissim nec tincidunt non, viverra vel lacus. Praesent velit risus, vehicula dignissim vulputate at, euismod non arcu. Ut tempor purus et pharetra sodales. Mauris luctus ante malesuada nibh aliquet, in ornare lorem egestas. Mauris semper tincidunt est. Proin sed venenatis lorem. Maecenas nibh tellus, sollicitudin vitae sem ut, euismod viverra orci. Maecenas bibendum justo nunc, in lacinia metus imperdiet ut. Aenean tristique ligula vel mi lobortis, et volutpat metus facilisis. Sed aliquam ultricies est, id ornare eros condimentum a. Nunc volutpat venenatis gravida.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: salmonColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Booking',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed scelerisque lorem, vitae volutpat augue. Nulla leo quam, dignissim nec tincidunt non, viverra vel lacus. Praesent velit risus, vehicula dignissim vulputate at, euismod non arcu. Ut tempor purus et pharetra sodales. Mauris luctus ante malesuada nibh aliquet, in ornare lorem egestas. Mauris semper tincidunt est. Proin sed venenatis lorem. Maecenas nibh tellus, sollicitudin vitae sem ut, euismod viverra orci. Maecenas bibendum justo nunc, in lacinia metus imperdiet ut. Aenean tristique ligula vel mi lobortis, et volutpat metus facilisis. Sed aliquam ultricies est, id ornare eros condimentum a. Nunc volutpat venenatis gravida.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: salmonColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Tracking',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed scelerisque lorem, vitae volutpat augue. Nulla leo quam, dignissim nec tincidunt non, viverra vel lacus. Praesent velit risus, vehicula dignissim vulputate at, euismod non arcu. Ut tempor purus et pharetra sodales. Mauris luctus ante malesuada nibh aliquet, in ornare lorem egestas. Mauris semper tincidunt est. Proin sed venenatis lorem. Maecenas nibh tellus, sollicitudin vitae sem ut, euismod viverra orci. Maecenas bibendum justo nunc, in lacinia metus imperdiet ut. Aenean tristique ligula vel mi lobortis, et volutpat metus facilisis. Sed aliquam ultricies est, id ornare eros condimentum a. Nunc volutpat venenatis gravida.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              decoration: BoxDecoration(
                                color: salmonColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Timing',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed scelerisque lorem, vitae volutpat augue. Nulla leo quam, dignissim nec tincidunt non, viverra vel lacus. Praesent velit risus, vehicula dignissim vulputate at, euismod non arcu. Ut tempor purus et pharetra sodales. Mauris luctus ante malesuada nibh aliquet, in ornare lorem egestas. Mauris semper tincidunt est. Proin sed venenatis lorem. Maecenas nibh tellus, sollicitudin vitae sem ut, euismod viverra orci. Maecenas bibendum justo nunc, in lacinia metus imperdiet ut. Aenean tristique ligula vel mi lobortis, et volutpat metus facilisis. Sed aliquam ultricies est, id ornare eros condimentum a. Nunc volutpat venenatis gravida.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  SizedBox(height: 17),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
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
