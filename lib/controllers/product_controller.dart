import 'package:flutter_dunzo_mvp/config/firebase.dart';
import 'package:flutter_dunzo_mvp/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> productList = RxList<Product>();
  String collection = "fruits";

  // ignore: invalid_use_of_protected_member
  List<Product> get products => productList.value;

  @override
  void onInit() {
    super.onInit();
    productList.bindStream(getAllProducts());
  }

  Stream<List<Product>> getAllProducts() {
    return firebaseFirestore
        .collection(collection)
        .snapshots()
        .map((query) => query.docs.map((item) {
              return Product.fromJson(item.data());
            }).toList());
  }
}
