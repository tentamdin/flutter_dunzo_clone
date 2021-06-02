import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/firebase.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/models/cart.dart';
import 'package:flutter_dunzo_mvp/models/product.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  final productController = Get.find<ProductController>();
  int quantityValue;

  RxList<CartModel> cartList = RxList<CartModel>();
  String collection = "cartList";

  // ignore: invalid_use_of_protected_member
  List<CartModel> get carts => cartList.value;

  @override
  void onInit() {
    super.onInit();
    cartList.bindStream(getAllCarts());
  }

  Stream<List<CartModel>> getAllCarts() {
    return firebaseFirestore
        .collection(collection)
        .snapshots()
        .map((query) => query.docs.map((item) {
              return CartModel.fromJson(item.data());
            }).toList());
  }

  addProductToCart(Product product) {
    var uuid = Uuid();
    try {
      firebaseFirestore.collection(collection).doc(product.id).set({
        "id": uuid.v4(),
        "productId": product.id,
        "name": product.name,
        "quantity": product.quantity + 1,
        "price": product.price,
        "image": product.image,
        "cost": product.price,
      });
      firebaseFirestore
          .collection("fruits")
          .doc(product.id)
          .update({"quantity": product.quantity + 1});
      Get.snackbar("Item added", "${product.name} is added to your cart");
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
    // .cartList.add(product);
  }

  double get totalAmount => cartList.fold(
      0, (previousValue, element) => previousValue + element.cost);

  int get cartItems => cartList.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  bool isItemAlreadyAdded(Product product) {
    return cartList.where((item) => item.id == product.id).isNotEmpty;
  }

  void removeCartItem2(String id) {
    try {
      firebaseFirestore.collection(collection).doc(id).delete();
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.message);
    }
  }

  void decreaseQuantity(CartModel cartItem) {
    quantityValue = cartItem.quantity - 1;
    if (cartItem.quantity == 1) {
      removeCartItem2(cartItem.productId);
      firebaseFirestore
          .collection("fruits")
          .doc(cartItem.productId)
          .update({"quantity": quantityValue});
    } else {
      firebaseFirestore
          .collection("fruits")
          .doc(cartItem.productId)
          .update({"quantity": quantityValue});
      firebaseFirestore.collection(collection).doc(cartItem.productId).update({
        "quantity": quantityValue,
        "cost": quantityValue * cartItem.price,
      });
    }
  }

  void decreaseQuantity2(Product product) {
    quantityValue = product.quantity - 1;
    print("decreaseQuantity2 :: $quantityValue");
    if (product.quantity == 1) {
      removeCartItem2(product.id);
      firebaseFirestore
          .collection("fruits")
          .doc(product.id)
          .update({"quantity": quantityValue});
    } else {
      firebaseFirestore
          .collection("fruits")
          .doc(product.id)
          .update({"quantity": quantityValue});
      firebaseFirestore.collection(collection).doc(product.id).update({
        "quantity": quantityValue,
        "cost": quantityValue * product.price,
      });
    }
  }

  void increaseQuantity2(Product product) {
    quantityValue = product.quantity + 1;
    firebaseFirestore
        .collection("fruits")
        .doc(product.id)
        .update({"quantity": quantityValue});
    firebaseFirestore.collection(collection).doc(product.id).update({
      "quantity": quantityValue,
      "cost": quantityValue * product.price,
    });
  }

  void increaseQuantity(CartModel cartItem) {
    quantityValue = cartItem.quantity + 1;
    firebaseFirestore
        .collection("fruits")
        .doc(cartItem.id)
        .update({"quantity": quantityValue});
    firebaseFirestore.collection(collection).doc(cartItem.productId).update({
      "quantity": quantityValue,
      "cost": quantityValue * cartItem.price,
    });
  }
}
