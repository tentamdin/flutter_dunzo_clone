import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/widget/custom_appbar.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 1,
        titleWidget: Text(
          "Confirm Order",
          style: KBoldTextStyle,
        ),
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("13 Nature Vitamins"),
                  Text("+ Add more"),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
