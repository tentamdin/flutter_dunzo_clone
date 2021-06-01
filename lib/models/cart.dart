class CartModel {
  String id;
  String image;
  String name;
  int quantity;
  double cost;
  String productId;
  double price;

  CartModel({
    this.productId,
    this.id,
    this.image,
    this.name,
    this.quantity,
    this.cost,
    this.price,
  });

  CartModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    image = data["image"];
    name = data["name"];
    quantity = data["quantity"];
    cost = data["cost"];
    productId = data["productId"];
    price = data["price"];
  }

  Map toJson() => {
        "id": id,
        "productId": productId,
        "image": image,
        "name": name,
        "quantity": quantity,
        "cost": price * quantity,
        "price": price
      };
}
