// ignore_for_file: prefer_const_constructors

import 'package:add_to_cart_calc/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'Keyboard1',
          productImage: 'sd',
          productDescription: "Some Description 1234",
          price: 30),
      Product(
          id: 2,
          productName: 'Keyboard2',
          productImage: 'sd',
          productDescription: "Some Description 1234",
          price: 40),
      Product(
          id: 3,
          productName: 'Keyboard3',
          productImage: 'sd',
          productDescription: "Some Description 1234",
          price: 60),
    ];
    products.value = productResult;
  }
}
