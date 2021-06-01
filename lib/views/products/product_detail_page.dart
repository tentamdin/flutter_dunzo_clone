import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/widget/custom_appbar.dart';
import 'package:flutter_dunzo_mvp/widget/single_product.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({this.index});
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        titleWidget: Text(""),
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actionWidget: [],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Image.asset(
                productController.products[index].image,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.contain,
              ),
              SingleProduct(
                index: index,
                listTileOnTap: () {},
                listTileLeadingWidget: null,
                listTileTitleWidget: Text(
                  "${productController.products[index].name}",
                  style: KProductBoldStyle,
                ),
                listTileSubtitleWidget: Text(
                  "\u{20B9}${productController.products[index].price}",
                  style: KProductBoldStyle,
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
                thickness: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Important Information",
                      style: KBoldTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "The product image(s) shown are for representation purposes only. The actual product may vary. It is recommended to read the product labels (if any), batch details, directions for use, etc., as contained in the actual product before consuming and/or utilizing the product. The product is meant for fresh and immediate consumption, or as specified by the seller of the product. For other information, please contact the merchant directly."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
