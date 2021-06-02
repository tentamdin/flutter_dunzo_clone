class Product {
  String id;
  String name;
  String image;
  String description;
  double price;
  int quantity;

  Product(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    description = json["description"];
    price = json["price"] != null ? double.parse(json["price"]) : json["price"];
    quantity = json["quantity"];
  }
}
