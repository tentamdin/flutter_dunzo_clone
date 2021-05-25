import 'package:flutter_zomato/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    await Future.delayed(Duration(seconds: 1));
    var res = [
      Product(
          id: 1,
          price: 26,
          productDescription: 'Chikoo description ',
          productImage: 'assets/imgs/fruit/chiko.jpg',
          productName: 'Chikoo'),
      Product(
          id: 2,
          price: 76,
          productDescription: 'Orange description ',
          productImage: 'assets/imgs/fruit/orange.jpeg',
          productName: 'Orange'),
      Product(
          id: 3,
          price: 150,
          productDescription: 'Mango description',
          productImage: 'assets/imgs/fruit/mango.jpeg',
          productName: 'Mango'),
      Product(
          id: 4,
          price: 53,
          productDescription: 'WaterMelon description',
          productImage: 'assets/imgs/fruit/watermelon.png',
          productName: 'WaterMelon'),
      Product(
          id: 5,
          price: 58,
          productDescription: 'Sweet Lime description',
          productImage: 'assets/imgs/fruit/sweetlime.jpeg',
          productName: 'Sweet Line'),
      Product(
          id: 6,
          price: 120,
          productDescription: 'Apple description',
          productImage: 'assets/imgs/fruit/apple.png',
          productName: 'Apple'),
      Product(
          id: 7,
          price: 40,
          productDescription: 'Banana description',
          productImage: 'assets/imgs/fruit/banana.png',
          productName: 'Banana'),
      Product(
          id: 8,
          price: 234,
          productDescription: 'Plum description',
          productImage: 'assets/imgs/fruit/plum.jpeg',
          productName: 'Plum'),
      Product(
          id: 9,
          price: 50,
          productDescription: 'Guava description',
          productImage: 'assets/imgs/fruit/guava.jpeg',
          productName: 'Guava'),
    ];

    products.value = res;
  }
}
