import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final shoppingController = Get.put(ProductController());
  var cartList = <Product>[].obs;
  int get cartCount => cartList.length;
  RxInt productIndex = 0.obs;
  double get totalAmount => cartList.fold(
      0, (previousValue, element) => previousValue + element.price);
  // get the cartitem list by removing duplicate products
  var displayCartItem = <Product>[].obs;
  List<Product> get cartItems =>
      displayCartItem.value = cartList.toSet().toList();

  addProductToCart(Product product) {
    cartList.add(product);
  }

  void removeCartItem(Product product) {
    try {
      cartList.remove(product);
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.message);
    }
  }

  void decreaseQuantity(Product product) {
    product.quantity.value--;
  }

  void increaseQuantity(Product product) {
    product.quantity.value++;
  }

  // void increment(index) => shoppingController.products[index].quantity.value++;
  // void decrement(index) => shoppingController.products[index].quantity.value--;
}
