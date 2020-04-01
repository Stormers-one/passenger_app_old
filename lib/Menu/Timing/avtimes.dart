import 'dart:async';

import 'package:flutter/material.dart';
import 'package:o_k/shared/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:o_k/shared/constants.dart';

class Aanavandi extends StatefulWidget {
  @override
  _AanavandiState createState() => _AanavandiState();
  
}

class _AanavandiState extends State<Aanavandi> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  String from = selectedTimingFrom.replaceAll(' ', '-').toLowerCase();
  String to = selectedTimingTo.replaceAll(' ', '-').toLowerCase();
  String time;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Bus Timings',
          home: Scaffold( 
            appBar: AppBar(
              elevation: 0,
              title: Text('Bus Timing'),
              backgroundColor: red,
            ),
            drawer: Drawer(),
            body :WebView(
            initialUrl: 'https://www.aanavandi.com//search/results/source/$from/destination/$to/timing/$time1',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
          )
      )
    );
  }
}