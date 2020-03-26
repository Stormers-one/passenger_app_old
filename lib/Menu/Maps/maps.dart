import 'package:flutter/material.dart';
import 'package:o_k/shared/busSearch.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'mapview.dart';

class Maps extends StatefulWidget {
  @override
  _Maps createState() => _Maps();
}

class _Maps extends State<Maps> {
  TextEditingController _controller;
  TextEditingController _controller1;

  @override
  void initState() {
    _controller = new TextEditingController();
    _controller1 = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller1?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Maps'),
          backgroundColor: Colors.red[500],
        ),
        drawer: DrawerBuild(),
        body: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Form(
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              controller: _controller,
                              style: new TextStyle(color: Colors.black),
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: BusSearch("MFrom", _controller));
                              },
                              decoration: textInputDecoration("From"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new TextFormField(
                              controller: _controller1,
                              style: new TextStyle(color: Colors.black),
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: BusSearch("MTo", _controller1));
                              },
                              decoration: textInputDecoration("To"),
                              obscureText: false,
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapView()),
                                  );
                                },
                                child: const Text('Search',
                                    style: TextStyle(fontSize: 20)),
                                color: Colors.red,
                                textColor: Colors.white,
                                splashColor: Colors.grey,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
