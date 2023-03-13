import 'package:get/get.dart';
import 'package:getx/models/Products/product_model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  int get itemsInCart => cartItems.length;

  // var totAmountWithGetBuilder = 0.0;

  double? get totalPrice =>
      cartItems.fold(0, (sum, item) => sum! + item.price!);

  void addToCart(ProductModel product) {
    cartItems.add(product);
    product.quantity++;
  }

  void removeFromCart(ProductModel product) {
    if (product.quantity == 0) {
      
    } else {
      cartItems.remove(product);
      product.quantity--;
    }
  }
}
