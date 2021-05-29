import 'package:flutter_zomato/controllers/product_controller.dart';
import 'package:flutter_zomato/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final shoppingController = Get.put(ProductController());
  var cartList = <Product>[].obs;
  int get cartCount => cartList.length;
  double get totalAmount => cartList.fold(
      0, (previousValue, element) => previousValue + element.price);

  addProductToCart(Product product) {
    cartList.add(product);
  }

  removeFromcart(Product product) {
    cartList.remove(product);
  }

  increment(index) => shoppingController.products[index].quantity.value++;
  decrement(index) => shoppingController.products[index].quantity.value--;
}
