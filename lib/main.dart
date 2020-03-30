import 'package:flutter/material.dart';
import 'package:o_k/Menu/Maps/app_state.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/auth.dart';
import 'Wrapper.dart';
import 'package:provider/provider.dart';
// import 'loginPage.dart';
// import 'homepage.dart';
// import 'help.dart';
// import 'reports.dart';
// import 'tracking.dart';
// import 'timing.dart';
// import 'maps.dart';
import 'Menu/Maps/app_state.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: AppState(),
      )
    ], child: Odukomban()));

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.red, accentColor: Colors.redAccent),
        home: Wrapper(),
      ),
    );
  }
}
