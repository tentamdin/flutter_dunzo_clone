import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey.shade600,
          ),
        ),
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
