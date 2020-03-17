import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

final String uid;
DatabaseService({this.uid});
//collection reference
final CollectionReference userCollecation = Firestore.instance.collection('Users');
  
  Future updateUserData(String fname,String email, int phno) async {
    return await userCollecation.document(uid).setData({
      'Full Name': fname,
      'Email': email,
      'Phone Number': phno,
    });
  }

  //get user stream

  Stream<QuerySnapshot> get users {
    return userCollecation.snapshots();
  }

}