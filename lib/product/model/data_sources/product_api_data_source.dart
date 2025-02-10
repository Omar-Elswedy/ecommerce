import 'dart:convert';

import 'package:ecommerce/product/model/data_model/product_details.dart';
import 'package:ecommerce/product/model/data_sources/product_data_source.dart';
import 'package:http/http.dart' as http;

class ProductAPIDataSource extends ProductDataSource {
  @override
  Future<List<ProductDetails>?> getAllProducts() async {
    List<ProductDetails>? products;
    try {
      http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      List<dynamic> productList = jsonDecode(response.body);
      products = productList.map((e) => ProductDetails.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
    return products;
  }

  @override
  Future<ProductDetails?> getProductDetails(int productId) async {
    ProductDetails? product;
    try {
      http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      List<dynamic> products = jsonDecode(response.body);
      List<ProductDetails?> productList =
          products.map((e) => ProductDetails.fromJson(e)).toList();
      product = productList.firstWhere((element) => element!.id == productId);
    } catch (e) {
      print(e);
      return null;
    }
    return product;
  }
}
