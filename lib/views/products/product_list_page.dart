import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/controllers/cart_controller.dart';
import 'package:flutter_zomato/controllers/product_controller.dart';
import 'package:flutter_zomato/views/products/single_product.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  final shoppingController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
        title: Text("Fresh Friut"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ],
      ),
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
            : BottomSheet(
                onClosing: () {
                  print("Cart is empty");
                },
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 40, right: 20, left: 20),
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
                                EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                          onPressed: () {},
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
                }),
      ),
    );
  }
}
