import 'package:cloud_firestore/cloud_firestore.dart';

import '../users_fetch.dart';

class DatabaseService {

final String uid;
DatabaseService({this.uid});
//collection reference
final CollectionReference userCollecation = Firestore.instance.collection('Users');
  
  Future updateUserData(String fname,String email, String phno) async {
    return await userCollecation.document(uid).setData({
      'Full Name': fname,
      'Email': email,
      'Phone Number': phno,
    });
  }


  //user list from snapshot

  List<Users> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Users(
        fname: doc.data['Full Name'] ?? '',
        email: doc.data['Email'] ?? '',
        phno: doc.data['Phone Number'] ?? '',
      );
    }).toList();
  }

  //get user stream

  Stream<List<Users>> get users {
    return userCollecation.snapshots()
    .map(_userListFromSnapshot);
  }

}