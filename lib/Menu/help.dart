import 'package:flutter/material.dart';
import 'package:o_k/homepage.dart';
import 'package:o_k/Menu/reports.dart';
import 'package:o_k/User/profile.dart';
import 'package:o_k/User/user_count.dart';
import 'package:o_k/shared/drawer.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          title: Text('Help'),
        ),
        drawer: DrawerBuild(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Helpline No.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          
                        ),
                      ),
                    
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'KeralaRTC Hub',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Developers',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nAnandu R\nAfthab Nihar\nAishwarya Michael\nRachel Kunjumon\nSmitha John\nKennith Philips',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Facts',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          
                        ),
                      ),
                    
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Maps',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Booking',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Tracking',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text.rich(
                        TextSpan(
                          text: 'Timing',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
