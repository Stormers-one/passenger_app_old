import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'loginPage.dart';
import 'model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null) {
      return LoginPage();
    }
    else{
      return Homepage();
    }
    //return Homepage();
  }
}