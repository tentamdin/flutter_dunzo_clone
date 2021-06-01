import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/firebase.dart';
import 'package:flutter_dunzo_mvp/controllers/product_controller.dart';
import 'package:flutter_dunzo_mvp/models/cart.dart';
import 'package:flutter_dunzo_mvp/models/product.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  final productController = Get.find<ProductController>();

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
        "quantity": 1,
        "price": product.price,
        "image": product.image,
        "cost": product.price
      });
      product.quantity.value++;
      Get.snackbar("Item added", "${product.name} is added to your cart");
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
    // .cartList.add(product);
  }

  RxInt productIndex = 0.obs;
  double get totalAmount => cartList.fold(
      0, (previousValue, element) => previousValue + element.cost);

  int get cartItems => cartList.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  bool isItemAlreadyAdded(Product product) {
    return cartList.where((item) => item.id == product.id).isNotEmpty;
  }

  bool checkCartQuantityValue(index) {
    print("Inisde checkcart  ${carts.length}");
    if (cartList.length == 0) {
      print("empty cart");
      return true;
    } else {
      bool isIdEqual = carts
          .every((cart) => productController.products[index].id == cart.id);
      print("For every index $index , isIdEqual $isIdEqual");
      return isIdEqual;
    }
    // firebaseFirestore
    //     .collection(collection)
    //     .where("productId", isEqualTo: productController.products[index].id)
    //     .get()
    //     .then((querySnapshot) {
    //   print("Querysnapshot");
    //   querySnapshot.docs.forEach((data) {
    //     print("Quanity :: ${data.data()["quantity"]} ");
    //     var quantity = data.data()["quantity"];
    //     return quantity;
    //   });
    // });
  }

  void removeCartItem(Product product) {
    try {
      cartList.remove(product);
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.message);
    }
  }

  void removeCartItem2(Product product) {
    try {
      firebaseFirestore.collection(collection).doc(product.id).delete();
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.message);
    }
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore.collection(collection).doc().update(data);
  }

  void decreaseQuantity(CartModel cartItem) {
    Product product = Product(
      id: cartItem.productId,
      name: cartItem.name,
      image: cartItem.image,
      description: "",
      price: cartItem.price,
    );
    print("product quantity 1 ${product.quantity.value}");
    product.quantity.value = cartItem.quantity;
    print("product quantity 2 ${product.quantity.value}");
    if (product.quantity.value == 1) {
      print("product quantity 3 ${product.quantity.value}");
      removeCartItem2(product);
      product.quantity.value--;
      print("product quantity 4 ${product.quantity.value}");
    } else {
      print("product quantity 3 ${product.quantity.value}");
      product.quantity.value--;
      print("product quantity 4 ${product.quantity.value}");
      firebaseFirestore.collection(collection).doc(product.id).update({
        "quantity": product.quantity.value,
        "cost": product.quantity.value * product.price,
      });
    }
  }

  void decreaseQuantity2(Product product) {
    if (product.quantity.value == 1) {
      removeCartItem2(product);
      product.quantity.value--;
    } else {
      product.quantity.value--;
      firebaseFirestore.collection(collection).doc(product.id).update({
        "quantity": product.quantity.value,
        "cost": product.quantity.value * product.price,
      });
    }
  }

  void increaseQuantity2(Product product) {
    product.quantity.value++;
    firebaseFirestore.collection(collection).doc(product.id).update({
      "quantity": product.quantity.value,
      "cost": product.quantity.value * product.price,
    });
  }

  void increaseQuantity(CartModel cartItem) {
    Product product = Product(
      id: cartItem.productId,
      name: cartItem.name,
      image: cartItem.image,
      description: "",
      price: cartItem.price,
    );
    product.quantity.value = cartItem.quantity;
    product.quantity.value++;
    firebaseFirestore.collection(collection).doc(product.id).update({
      "quantity": product.quantity.value,
      "cost": product.quantity.value * product.price,
    });
  }
}
