import 'package:flutter/material.dart';
import 'package:o_k/Menu/Maps/app_state.dart';
import 'package:o_k/shared/model/user.dart';
import 'package:o_k/services/auth.dart';
import 'package:o_k/shared/spashScreen.dart';
import 'package:provider/provider.dart';
import 'Menu/Maps/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await firebase_auth.FirebaseAuth.instance
      .useEmulator('http://localhost:9099');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AppState(),
    )
  ], child: Odukomban()));
}

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: Authservice().user,
        child: new MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Quicksand-Medium'),
            home: SplashScreen()));
  }
}
