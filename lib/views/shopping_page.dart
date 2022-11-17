import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.products[index].productName}",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        "${controller.products[index].productDescription}"),
                                  ],
                                ),
                                Text(
                                  "${controller.products[index].price}",
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                child: Text('Add to Cart')),
                            Obx(
                              () => IconButton(
                                icon: controller
                                        .products[index].isFavorite.value
                                    ? Icon(
                                        Icons.check_box_outline_blank_rounded)
                                    : Icon(
                                        Icons.check_box_outline_blank_rounded),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     "Total Amount : \$ ${cartController.totalPrice} ",
            //     style: TextStyle(fontSize: 32, color: Colors.white),
            //   );
            // }),
            Obx(() {
              return Text(
                "Total Amount : \$ ${cartController.totalPrice} ",
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {},
        label: GetX<CartController>(builder: (CartController) {
          return Text(
            cartController.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
