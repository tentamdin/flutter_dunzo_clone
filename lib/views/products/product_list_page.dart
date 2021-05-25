import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/controllers/cart_controller.dart';
import 'package:flutter_zomato/controllers/product_controller.dart';
import 'package:flutter_zomato/views/products/product_detail_page.dart';
import 'package:flutter_zomato/widget/bottom_cart_sheet.dart';
import 'package:flutter_zomato/widget/custom_appbar.dart';
import 'package:flutter_zomato/widget/single_product.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  final shoppingController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          elevation: 2,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {},
          ),
          titleWidget: Text("Fresh Friut", style: TextStyle(fontSize: 18)),
          actionWidget: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ]),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ProductController>(builder: (_) {
                return ListView.builder(
                    itemCount: shoppingController.products.length,
                    itemBuilder: (context, index) {
                      return SingleProduct(
                        index: index,
                        listTileOnTap: () {
                          Get.to(() => ProductDetailPage(
                                index: index,
                              ));
                        },
                        listTileLeadingWidget: Container(
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
                        listTileTitleWidget: Text(
                          "${shoppingController.products[index].productName}",
                          style: KProductBoldStyle,
                        ),
                        listTileSubtitleWidget: Text(
                          "\u{20B9}${shoppingController.products[index].price}",
                          style: KProductBoldStyle,
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
      bottomSheet: Obx(
        () => cartController.cartCount == 0
            ? Container(
                height: 0,
              )
            : BottomCartSheet(),
      ),
    );
  }
}
