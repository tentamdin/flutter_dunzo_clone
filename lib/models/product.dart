import 'package:get/state_manager.dart';

class Product {
  final int productId;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
    this.productId,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
  });

  final quantity = 0.obs;
}
