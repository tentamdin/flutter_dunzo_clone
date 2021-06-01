import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/views/products/product_detail_page.dart';
import 'package:flutter_dunzo_mvp/widget/bottom_cart_sheet.dart';
import 'package:flutter_dunzo_mvp/widget/custom_appbar.dart';
import 'package:flutter_dunzo_mvp/widget/single_product.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Get.back();
            },
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
        child: GetX<ProductController>(
            init: productController,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: cartController.carts.length == 0 ? 0 : 50),
                child: ListView.builder(
                  itemCount: productController.products.length,
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
                          color: Colors.white,
                        ),
                        child: Image.network(
                          productController.products[index].image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      listTileTitleWidget: Text(
                        "${productController.products[index].name}",
                        style: KProductBoldStyle,
                      ),
                      listTileSubtitleWidget: Text(
                        "\u{20B9}${productController.products[index].price}",
                        style: KProductBoldStyle,
                      ),
                    );
                  },
                ),
              );
            }),
      ),
      bottomSheet: Obx(
        () => cartController.carts.length == 0
            ? Container(
                height: 0,
              )
            : BottomCartSheet(),
      ),
    );
  }
}

// SingleProduct(
//   index: index,
//   listTileOnTap: () {
//     Get.to(() => ProductDetailPage(
//           index: index,
//         ));
//   },
//   listTileLeadingWidget: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Colors.white,
//     ),
//     child: Image.asset(
//       productController.products[index].image,
//       width: 100,
//       height: 100,
//       fit: BoxFit.contain,
//     ),
//   ),
//   listTileTitleWidget: Text(
//     "${productController.products[index].name}",
//     style: KProductBoldStyle,
//   ),
//   listTileSubtitleWidget: Text(
//     "\u{20B9}${productController.products[index].price}",
//     style: KProductBoldStyle,
//   ),
// );
