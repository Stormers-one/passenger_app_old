import 'package:flutter/material.dart';
import 'package:o_k/Menu/Booking/bookingtiles.dart';
import 'package:o_k/User/users_fetch.dart';
import 'package:o_k/model/ticketmodel.dart';
import 'package:o_k/shared/constants.dart';
import 'package:provider/provider.dart';

class BookLister extends StatefulWidget {
  @override
  _BookListerState createState() => _BookListerState();
}

class _BookListerState extends State<BookLister> {
  @override
  Widget build(BuildContext context) {
    final book = Provider.of<List<TicketData>>(context) ?? [];
    book.forEach((f){
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