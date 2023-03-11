import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx/models/Products/product_model/product_model.dart';

class ShoppingController extends GetxController {
  var products = <ProductModel>[].obs;
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var response = await dio.get("https://fakestoreapi.com/products?limit=5");
    // print(res.data);
    List<dynamic> data = response.data;

    var result = data.map((e) => ProductModel.fromJson(e)).toList();
    print("result is from model = >> $result");

    products.value = result;
  }
}
