import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_k/model/busStop.dart';
import 'package:o_k/model/user.dart';
import 'package:provider/provider.dart';
import 'package:o_k/User/users_fetch.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
//collection reference
  final CollectionReference userCollecation =
      Firestore.instance.collection('Users');


  Future updateUserData(String fname, String email, String phno) async {
    return await userCollecation.document(uid).setData({
      'Full Name': fname,
      'Email': email,
      'Phone Number': phno,
    });
  }

  //user list from snapshot

  List<Users> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Users(
        fname: doc.data['Full Name'] ?? '',
        email: doc.data['Email'] ?? '',
        phno: doc.data['Phone Number'] ?? '',
      );
    }).toList();
  }

  //userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      fname: snapshot.data['Full Name'],
      email: snapshot.data['Email'],
      phno: snapshot.data['Phone Number'],
    );
  }

  //get user stream

  Stream<List<Users>> get users {
    return userCollecation.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollecation.document(uid).snapshots().map(_userDataFromSnapshot);
  }
//Bus Stops Add
final CollectionReference busStopCollection =
      Firestore.instance.collection('Bus Stops');

Future updateBusStopData(String stopName, List<String> caseSearch) async {
    return await busStopCollection.document().setData({
      'Stop Name': stopName,
      'Case Search': caseSearch,
      });
  }


  List<BusStopData> _busStopListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BusStopData(
        stopName: doc.data['Stop Name'] ?? '',
      );
    }).toList();
  }
Stream<List<BusStopData>> get busStopData {
    return busStopCollection.snapshots().map(_busStopListFromSnapshot);
}
getBusStopList(String query) {
  return Firestore.instance
        .collection("Bus Stops")
        .where("Case Search", arrayContains: query)
        .getDocuments();
}
}

