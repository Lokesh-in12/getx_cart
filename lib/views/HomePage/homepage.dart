import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/CartController/cart_controller.dart';
import 'package:getx/controllers/ShoppingController/shopping_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Getx product page")),
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            child: Card(
                              color: Colors.blue,
                              child: LimitedBox(
                                  child: Text(
                                "${controller.products[index].title}",
                              )),
                            ),
                          ),
                        ),
                        CupertinoButton(
                          child: Icon(
                            Icons.add_box,
                            size: 40,
                          ),
                          onPressed: () {
                            cartController
                                .addToCart(controller.products[index]);
                          },
                        )
                      ],
                    );
                  });
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GetX<CartController>(builder: (cartContoller) {
              return Text(
                  "Total price in cart it ${cartContoller.totalPrice!.toStringAsFixed(2)}");
            }),
          )
        ],
      ),
      floatingActionButton: GetX<CartController>(
        builder: (_) {
          return FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.add_shopping_cart),
              label: Text(_.itemsInCart.toString()));
        },
      ),
    ));
  }
}
