import 'package:flutter/material.dart';
import 'package:o_k/Menu/Maps/app_state.dart';
import 'package:o_k/driver/drive_state.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/shared/spashScreen.dart';
import 'package:provider/provider.dart';
import 'Menu/Maps/app_state.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: AppState(),
      ),
      ChangeNotifierProvider.value(
        value: DriveState(),
      )
    ], child: Odukomban()));

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Quicksand-Medium'),
        home: SplashScreen(),
      ),
    );
  }
}
