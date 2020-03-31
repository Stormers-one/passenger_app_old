import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/booking_lister.dart';
import 'package:o_k/model/ticketmodel.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TicketData>>.value(
      value: DatabaseService().ticketdata,
      child: MaterialApp(
        title: 'My Bookings',
        home: Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            elevation: 0,
            title: Text('My Bookings'),
            backgroundColor: Colors.red[500],
          ),
          drawer: DrawerBuild(),
          body: BookLister(),
          ),
      ),
    );
  }
}