import 'package:flutter/material.dart';
import 'package:o_k/Shared/services/mapServices/mapState.dart';
import 'package:o_k/shared/model/user.dart';
import 'package:o_k/Shared/services/firebaseServices/auth.dart';
import 'package:o_k/shared/spashScreen.dart';
import 'package:provider/provider.dart';
import 'Shared/services/mapServices/mapState.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: MapState(),
    )
  ], child: Odukomban()));
}

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        initialData: User(),
        value: Authservice().user,
        child: new MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Quicksand-Medium'),
            home: SplashScreen()));
  }
}
