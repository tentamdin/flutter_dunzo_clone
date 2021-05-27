import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';
import 'package:flutter_zomato/views/payment/payment_page.dart';
import 'package:flutter_zomato/widget/custom_appbar.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 1,
        titleWidget: Text(
          "Confirm Order",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("13 Nature Vitamins"),
                    Text("+ Add more"),
                  ],
                ),
                Column(
                  children: productList.getRange(0, 6).map<Widget>(
                    (product) {
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
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                        title: Text(
                          "${product}",
                          style: KProductBoldStyle,
                        ),
                        subtitle: Text(
                          "items quanity",
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
                                border: Border.all(color: Colors.grey.shade400),
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
                                          // cartController.decrement(index);
                                          // cartController.removeFromcart(
                                          //     shoppingController.products[index]);
                                        }),
                                  ),
                                  Text(
                                    "2",
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
                                          // cartController.increment(index);
                                          // cartController.addToCart(
                                          //     shoppingController.products[index]);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("\u{20B9}56"),
                          ],
                        ),
                      );
                    },
                  ).toList(),
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
                    hintText: "Any Instructions? Eg: Don't ring the doorbell",
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
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheet(
          onClosing: () {
            print("Cart is empty");
          },
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
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
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                      onPressed: () {
                        Get.to(() => PaymentPage());
                      },
                      child: Text(
                        'Pay \u{20B9}300',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
