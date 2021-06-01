import 'package:get/state_manager.dart';

class Product {
  String id;
  String name;
  String image;
  String description;
  double price;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    description = json["description"];
    price = json["price"] != null ? double.parse(json["price"]) : json["price"];
  }

  final quantity = 0.obs;
}
