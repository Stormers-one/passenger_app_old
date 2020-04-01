import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/database.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Image m = Image.asset('assets/images/profile_icon.jpg');

  //create user obj based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in annonymously

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in the user with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register user with email and password

  Future registerWithEmailAndPassword(
      String fname, String email, String password, String phno) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid

      await DatabaseService(uid: user.uid).updateUserData(fname, email, phno);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out the user

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  // Bus details add
  // Future addBusstops() async {
  //   try{
  //     int count=0;
  //     for(int i = 0 ; i< 2277 ; i++){
  //       List<String> tempList = [];
  //       String temp = stops[i],temp2=temp[0];
  //       for(int j = 1 ; j< temp.length +1; ++j){
  //         tempList.add(temp2);
  //         if(j!=temp.length){
  //         temp2 += temp[j];
  //         }
  //       }
  //       await DatabaseService(uid:null).updateBusStopData(stops[i],tempList);      //CODE FOR BUS STOP ADDING TO DATABSE
  //       // print(stops[i]);
  //       // print(tempList);
  //       count++;
  //       print(count);
  //     }
  //   }
  //   catch(e){
  //     print(e);
  //   }
  //   return 0;
  // }
}
