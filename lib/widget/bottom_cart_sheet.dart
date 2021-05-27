import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/controllers/cart_controller.dart';
import 'package:flutter_zomato/views/cart/cart_page.dart';
import 'package:get/get.dart';

class BottomCartSheet extends StatelessWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {
          print("Cart is empty");
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(top: 10, bottom: 40, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("${cartController.cartCount} Items",
                          style: KProductBoldStyle),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "\u{20B9} ${cartController.totalAmount}",
                        style: TextStyle(
                          color: Colors.tealAccent.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.tealAccent.shade700,
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  onPressed: () {
                    Get.to(() => CartPage());
                  },
                  child: Text(
                    'View Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
