import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:get/get.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct(
      {this.index,
      this.listTileLeadingWidget,
      this.listTileSubtitleWidget,
      this.listTileOnTap,
      this.listTileTitleWidget});

  final productController = Get.find<ProductController>();
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
        trailing: productController.products[index].quantity == 0
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
                  cartController
                      .addProductToCart(productController.products[index]);
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
                            cartController.decreaseQuantity2(
                                productController.products[index]);
                          }),
                    ),
                    Obx(() => Text(
                          "${productController.products[index].quantity}",
                          style: KProductChangingButtonTextStyle,
                        )),
                    Expanded(
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.tealAccent.shade700,
                          ),
                          onPressed: () {
                            cartController.increaseQuantity2(
                                productController.products[index]);
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
