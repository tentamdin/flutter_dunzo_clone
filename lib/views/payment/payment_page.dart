import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Paid Successfully",
              style: KProductChangingButtonTextStyle,
            ),
            CircleAvatar(
              child: Icon(Icons.payment_outlined),
              radius: 20,
            ),
            Text(
              "Order will be delivered in 60 minutes!",
              style: KBoldTextStyle,
            )
          ],
        ),
      )),
    );
  }
}
