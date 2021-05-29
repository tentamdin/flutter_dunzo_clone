import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text("Account Details"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hi, Tamdin!\n",
                          style: KBoldTextStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                            child: Icon(Icons.phone, size: 14),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                            text: "  +91 56745443433\n",
                            style: KProductBoldStyle.copyWith(
                              color: Colors.grey,
                            )),
                        WidgetSpan(
                            child: Icon(Icons.email, size: 14),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                            text: "   tamdin@gmail.com\n",
                            style: KProductBoldStyle.copyWith(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Edit ",
                          style: KBoldTextStyle.copyWith(
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                        WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.greenAccent.shade700,
                            ),
                            alignment: PlaceholderAlignment.middle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6,
              color: Colors.grey.shade100,
            ),
          ],
        ),
      )),
    );
  }
}
