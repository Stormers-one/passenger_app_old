import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_k/shared/model/busStop.dart';
import 'package:o_k/shared/model/ticketmodel.dart';
import 'package:o_k/shared/model/user.dart';
import 'package:o_k/User/users_fetch.dart';
import 'package:o_k/shared/constants.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
//collection reference
  final CollectionReference userCollecation =
      FirebaseFirestore.instance.collection('Users');

  Future updateUserData(String fname, String email, String phno) async {
    return await userCollecation.doc(uid).set({
      'Full Name': fname,
      'Email': email,
      'Phone Number': phno,
    });
  }

  //user list from snapshot

  List<Users> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Users(
        fname: doc['Full Name'] ?? '',
        email: doc['Email'] ?? '',
        phno: doc['Phone Number'] ?? '',
      );
    }).toList();
  }

  //userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      fname: snapshot['Full Name'],
      email: snapshot['Email'],
      phno: snapshot['Phone Number'],
    );
  }

  //get user stream

  Stream<List<Users>> get users {
    return userCollecation.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollecation.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

//Bus Stops Add
  final CollectionReference busStopCollection =
      FirebaseFirestore.instance.collection('Bus Stops');

  Future updateBusStopData(String stopName, List<String> caseSearch) async {
    return await busStopCollection.doc().set({
      'Stop Name': stopName,
      'Case Search': caseSearch,
    });
  }

  List<BusStopData> _busStopListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BusStopData(
        stopName: doc['Stop Name'] ?? '',
      );
    }).toList();
  }

  Stream<List<BusStopData>> get busStopData {
    return busStopCollection.snapshots().map(_busStopListFromSnapshot);
  }

  getBusStopList(String query) {
    return FirebaseFirestore.instance
        .collection("Bus Stops")
        .where("Case Search", arrayContains: query)
        .get();
  }
//BOOKING STUFF

  final CollectionReference ticketsCollection =
      FirebaseFirestore.instance.collection('Bookings');
  Future addBooking(String uid, var fare, String bID, String phno, String from,
      String to, String busType) async {
    return await ticketsCollection.doc(bID).set({
      'UID': uid,
      'Fare': fare,
      'Booking ID': bidn,
      'From': from,
      'To': to,
      'Booking Time': DateTime.now(),
      'Phone Number': phno,
      'Bus Type': busType,
    });
  }

  List<TicketData> _bookingList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TicketData(
        bookid: doc['Booking ID'] ?? '',
        booktime: doc['Booking Time'].toString() ?? '',
        bookfare: doc['fare'].toString() ?? '',
        bookfrom: doc['From'] ?? '',
        bookto: doc['To'] ?? '',
        bookphno: doc['Phone Number'] ?? '',
        bookuid: doc['UID'] ?? '',
        bookbustype: doc['Bus Type'] ?? '',
      );
    }).toList();
  }

  Stream<List<TicketData>> get ticketdata {
    return ticketsCollection
        .where('UID', isEqualTo: userID)
        .snapshots()
        .map(_bookingList);
  }
}
