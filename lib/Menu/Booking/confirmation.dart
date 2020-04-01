import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:o_k/Menu/Booking/Ticket.dart';
import 'package:o_k/model/user.dart';
import 'package:o_k/services/database.dart';
import 'package:o_k/shared/constants.dart';
import 'package:o_k/shared/drawer.dart';
import 'package:o_k/shared/colors.dart';
import 'package:o_k/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingConfirm extends StatefulWidget {
  _BookingConfirm createState() => _BookingConfirm();
}
class _BookingConfirm extends State<BookingConfirm>{
  Razorpay _razorpay;
  bool loading = false;
  void initState(){
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }
  void openCheckout() async{
    var options = {
      'key' : 'rzp_test_XJNlckGyObxbKr',
      'amount' : fare*100,
      'name' : 'Odu Komban',
      'description' : 'Unreserved Ticket Booking',
      'prefill' : {'contact': '','email':''},
    };
    try{
      _razorpay.open(options);
      loading= false;
    }
    catch(e){
      print(e);
    }
  }
  void _handlePaymentSucess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS" + response.paymentId);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              TicketDisplay()));
  }
  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "PAYMENT ERROR" + " " +  response.code.toString() + " " + response.message );
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading ? Loading():  MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Confirm Details',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
            elevation: 0,
            title: Text('Confirm Details'),
            backgroundColor: red,
            actions: <Widget>[]),
        drawer: DrawerBuild(),
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StreamBuilder<UserData>(
                        stream: DatabaseService(uid: user.uid).userData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            UserData userData = snapshot.data;
                            return Form(
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: userData.fname,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.account_box),
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: selectedBookingFrom,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.person_pin), //directions_bus
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                    ),
                                    new TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                        labelText: selectedBookingTo,
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                        icon: Icon(Icons.pin_drop),
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  new TextField(
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: fare.toString(),
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                      icon: Icon(MdiIcons.currencyInr),
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: RaisedButton(
                                        onPressed: () {
                                          loading = true;
                                          openCheckout();
                                        },
                                        child: const Text('Proceed To Payment',
                                            style: TextStyle(fontSize: 18)),
                                        color: red,
                                        textColor: Colors.white,
                                        splashColor: Colors.grey,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Loading();
                          }
                      }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
