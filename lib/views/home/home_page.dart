import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/views/account/account_page.dart';
import 'package:flutter_dunzo_mvp/views/cart/cart_page.dart';
import 'package:flutter_dunzo_mvp/views/products/product_list_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final cartController = Get.find<CartController>();

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
              // FirebaseFirestore.instance
              //     .collection("testing")
              //     .add({"timeStamp": Timestamp.fromDate(DateTime.now())});
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => CartPage());
              // FirebaseFirestore.instance
              //     .collection("testing")
              //     .doc("NnnEgrosndMxTslQUN6G")
              //     .update({"name": "bye"});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search for a store/item, or a dish...",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What are you looking for?",
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
        ),
      ),
    );
  }
}
