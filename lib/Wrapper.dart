import 'package:flutter/material.dart';
import 'package:o_k/Signing_and_Auth/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:o_k/homepage.dart';
import 'package:o_k/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return LoginPage();
    } else {
      return Homepage();
    }
    //return Homepage();
  }
}
