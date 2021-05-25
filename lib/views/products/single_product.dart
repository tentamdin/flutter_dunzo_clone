import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/controllers/cart_controller.dart';
import 'package:flutter_zomato/controllers/product_controller.dart';
import 'package:get/get.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({
    this.index,
  });

  final shoppingController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Image.asset(
            shoppingController.products[index].productImage,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "${shoppingController.products[index].productName}",
          style: KProductBoldStyle,
        ),
        subtitle: Text(
          "\u{20B9} ${shoppingController.products[index].price}",
          style: KProductBoldStyle,
        ),
        trailing: Obx(
          () => shoppingController.products[index].quantity.value == 0
              ? OutlinedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )),
                  onPressed: () {
                    cartController.increment(index);
                    cartController
                        .addToCart(shoppingController.products[index]);
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent.shade700,
                    ),
                  ),
                )
              : Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              size: 20,
                            ),
                            onPressed: () {
                              cartController.decrement(index);
                              cartController.removeFromcart(
                                  shoppingController.products[index]);
                            }),
                      ),
                      Text(
                          "${shoppingController.products[index].quantity.value}"),
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 20,
                            ),
                            onPressed: () {
                              cartController.increment(index);
                              cartController.addToCart(
                                  shoppingController.products[index]);
                            }),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
