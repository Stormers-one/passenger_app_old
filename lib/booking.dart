import 'package:flutter/material.dart';
import 'seating.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
        ),
        body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Form(
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "From", fillColor: Colors.red),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "To",
                              ),
                              obscureText: false,
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "Date Of Departure",
                                  fillColor: Colors.red),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Seating()),
                                );
                              },
                              child: const Text('Search',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.red,
                              textColor: Colors.orange,
                              splashColor: Colors.grey,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
