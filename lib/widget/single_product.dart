import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/controllers/cart_controller.dart';
import 'package:flutter_zomato/controllers/product_controller.dart';
import 'package:get/get.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct(
      {this.index,
      this.listTileLeadingWidget,
      this.listTileSubtitleWidget,
      this.listTileOnTap,
      this.listTileTitleWidget});

  final shoppingController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final int index;
  final Function listTileOnTap;
  final Widget listTileLeadingWidget;
  final Widget listTileTitleWidget;
  final Widget listTileSubtitleWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: ListTile(
        onTap: listTileOnTap,
        leading: listTileLeadingWidget,
        title: listTileTitleWidget,
        subtitle: listTileSubtitleWidget,
        trailing: Obx(
          () => shoppingController.products[index].quantity.value == 0
              ? OutlinedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
                    style: KProductChangingButtonTextStyle,
                  ),
                )
              : Container(
                  width: 85,
                  height: 35,
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
                        "${shoppingController.products[index].quantity.value}",
                        style: KProductChangingButtonTextStyle,
                      ),
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.tealAccent.shade700,
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
