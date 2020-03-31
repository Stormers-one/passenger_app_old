import 'package:flutter/material.dart';
import 'package:o_k/model/ticketmodel.dart';

class BookingTile extends StatelessWidget {
  final TicketData book;
  BookingTile({this.book});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
          color: Colors.orange[200],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile( 
            //  CircleAvatar(
            //    radius: 50.0,
            //    backgroundColor: Colors.red[300],
            //  ),
            title: Text("Booking ID: " +  book.bookid),
            subtitle: Text( "From: " + book.bookfrom + "\nTo: " +  book.bookto),
          ),
        ));
  }
}