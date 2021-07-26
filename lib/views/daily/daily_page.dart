import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/carousel_controller.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/views/account/account_page.dart';
import 'package:flutter_dunzo_mvp/views/cart/cart_page.dart';
import 'package:flutter_dunzo_mvp/views/daily/circular_carousel.dart';
import 'package:flutter_dunzo_mvp/views/daily/products_carousel.dart';
import 'package:flutter_dunzo_mvp/views/products/product_list_page.dart';
import 'package:flutter_dunzo_mvp/widget/search_bar.dart';
import 'package:get/get.dart';

class DailyPage extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final dailyCarouselController = Get.put(Carousel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Text(
                "Home ",
                style: KProductBoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => AccountPage());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: Colors.greenAccent.shade200,
                padding: EdgeInsets.all(16),
                child: SearchBar(
                  onTap: () {},
                  searchLabel: "Search for a groceries here",
                ),
              ),
              AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Center(
                    child: Text("Dunzo Daily"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 4 / 1.5,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Center(
                    child: Text("Dunzo Daily"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...optionList
                      .map(
                        (data) => CircularCarousel(
                          onTap: () {},
                          label: data,
                        ),
                      )
                      .toList(),
                ]),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProductsCarosuel(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Categories",
                        style: KBoldTextStyle,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.only(top: 20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 3,
                        children: productList
                            .map(
                              (product) => GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => ProductListPage(),
                                  );
                                },
                                child: GridTile(
                                  child: Material(
                                    elevation: 2,
                                    color: Colors.grey.shade50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          width: 0.5, color: Colors.grey),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      "assets/imgs/emptycart.jpg",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  footer: Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(4),
                                      ),
                                      side: BorderSide(
                                          width: 0.5, color: Colors.grey),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: GridTileBar(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        product,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
