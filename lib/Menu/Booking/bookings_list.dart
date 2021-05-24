import 'package:flutter/material.dart';
import 'package:o_k/shared/model/ticketmodel.dart';
import 'package:o_k/Shared/services/firebaseServices/database.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:provider/provider.dart';
import 'package:o_k/shared/Styling/colors.dart';

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TicketData>>.value(
      initialData: [],
      value: DatabaseService().getUserBookings,
      child: MaterialApp(
        title: 'My Bookings',
        theme: ThemeData(fontFamily: 'Quicksand-Medium'),
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            elevation: 0,
            title: Text('My Bookings'),
            backgroundColor: appBarColor,
          ),
          drawer: DrawerBuild(),
          body: BookLister(),
        ),
      ),
    );
  }
}

class BookLister extends StatefulWidget {
  @override
  _BookListerState createState() => _BookListerState();
}

class _BookListerState extends State<BookLister> {
  @override
  Widget build(BuildContext context) {
    final book = Provider.of<List<TicketData>>(context) ?? [];
    book.forEach((f) {
      print(f.bookid);
    });
    return ListView.builder(
      itemCount: book.length,
      itemBuilder: (context, index) {
        return BookingTile(book: book[index]);
      },
    );
  }
}

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
            //    backgroundColor: red,
            //  ),
            title: Text("Booking ID: " + book.bookid),
            subtitle: Text("From: " + book.bookfrom + "\nTo: " + book.bookto),
          ),
        ));
  }
}
