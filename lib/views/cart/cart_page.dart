import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/cart_controller.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/views/payment/payment_page.dart';
import 'package:flutter_dunzo_mvp/widget/custom_appbar.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final shoppingController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var displayCartItem = [].obs;
    displayCartItem.value = cartController.cartList.toSet().toList();
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 1,
        titleWidget: Text(
          cartController.cartList.length == 0 ? "Your Cart" : "Confirm Order",
          style: KBoldTextStyle,
        ),
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: cartController.cartList.length == 0
          ? SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      "assets/imgs/emptycart.jpg",
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Make your task list and Dunzo it now!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Store Name"),
                          Text(
                            "+ Add more",
                            style: TextStyle(
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => Column(
                          children: cartController.cartItems.map<Widget>(
                            (cartItem) {
                              return ListTile(
                                minLeadingWidth: 10,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 20,
                                    minWidth: 10,
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Colors.greenAccent.shade700,
                                  ),
                                ),
                                title: Text(
                                  "${cartItem.name}",
                                  style: KProductBoldStyle,
                                ),
                                subtitle: Text(
                                  "${cartItem.quantity}",
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 14,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 85,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  cartController
                                                      .decreaseQuantity(
                                                          shoppingController
                                                                  .products[
                                                              cartController
                                                                  .productIndex
                                                                  .value]);
                                                  cartController.removeCartItem(
                                                      shoppingController
                                                              .products[
                                                          cartController
                                                              .productIndex
                                                              .value]);
                                                }),
                                          ),
                                          Text(
                                            "${cartItem.quantity}",
                                            style:
                                                KProductChangingButtonTextStyle,
                                          ),
                                          Expanded(
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Colors
                                                      .tealAccent.shade700,
                                                ),
                                                onPressed: () {
                                                  cartController
                                                      .increaseQuantity(
                                                          shoppingController
                                                                  .products[
                                                              cartController
                                                                  .productIndex
                                                                  .value]);
                                                  cartController
                                                      .addProductToCart(
                                                          shoppingController
                                                                  .products[
                                                              cartController
                                                                  .productIndex
                                                                  .value]);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Text(
                                        "\u{20B9}${cartItem.price.toInt() * cartItem.quantity.toInt()}",
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        minLeadingWidth: 20,
                        leading: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                          ),
                        ),
                        title: Text(
                          "No Contact Delivery",
                          style: KProductBoldStyle,
                        ),
                        subtitle: Text(
                          'Partner will check with you and leave the order outside your door.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.notes_outlined,
                            color: Colors.grey,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minHeight: 0, minWidth: 40),
                          hintText:
                              "Any Instructions? Eg: Don't ring the doorbell",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(0),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Text(
                          "Payment Details",
                          style: KProductBoldStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item total"),
                          Text("Rs 155"),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Partner delivery fee"),
                          Text("Rs 30"),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("To pay"),
                          Text("Rs 185"),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomSheet: cartController.cartList.length == 0
          ? null
          : BottomSheet(
              onClosing: () {
                print("Cart is empty");
              },
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    0,
                  )),
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 40,
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                          title: Text(
                            "Home",
                            style: KBoldTextStyle,
                          ),
                          subtitle: Text(
                            "Home address",
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                          bottom: 10,
                          right: 20,
                          left: 20,
                        ),
                        child: ElevatedButton(
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
                          onPressed: () {
                            Get.to(() => PaymentPage());
                          },
                          child: Obx(
                            () => Text(
                              'Pay \u{20B9} ${cartController.totalAmount}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
