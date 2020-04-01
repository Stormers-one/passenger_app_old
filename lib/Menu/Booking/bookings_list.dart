import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/booking_lister.dart';
import 'package:o_k/model/ticketmodel.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';
import 'package:o_k/shared/colors.dart';


class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TicketData>>.value(
      value: DatabaseService().ticketdata,
      child: MaterialApp(
        title: 'My Bookings',
        theme: ThemeData(fontFamily: 'Quicksand-Medium'),
        home: Scaffold(
          backgroundColor: bgOrange,
          appBar: AppBar(
            elevation: 0,
            title: Text('My Bookings'),
            backgroundColor: red,
          ),
          drawer: DrawerBuild(),
          body: BookLister(),
          ),
      ),
    );
  }
}