import 'package:flutter/material.dart';
import 'package:o_k/Menu/search.dart';

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Maps'),
          backgroundColor: Colors.green[100],
        ),
        body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/map_m.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
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
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search()),
                              );
                            },
                            child: const Text('Search',
                                style: TextStyle(fontSize: 20)),
                            color: Colors.red,
                            textColor: Colors.white,
                            splashColor: Colors.grey,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
