import 'dart:convert';

import 'package:ecommerce/product/model/data_model/product_details.dart';
import 'package:flutter/cupertino.dart';

import '../../common/service_locator.dart';
import '../../common/shared_pref.dart';
import '../repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  ProductRepository productRepository = ProductRepository(
    ServiceLocator.productDataSource,
  );
  ProductDetails? productDetails;
  List<ProductDetails>? products;
  List<ProductDetails>? favoriteProducts;
  String? errorMessage;
  bool waiting = false;

  Future getProducts() async {
    waiting = true;
    notifyListeners();
    try {
      List<ProductDetails>? product = await productRepository.getAllProducts();
      products = product;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }

  Future setFavoriteProduct(ProductDetails product) async {
    waiting = true;
    notifyListeners();
    List<ProductDetails>? favProducts = await getFavoriteProducts();
    List<String>? favProductsEncoded;
    try {
      if (favProducts!.isEmpty) {
        await SharedPrefs()
            .setStringList('favoriteList', [jsonEncode(product).toString()]);
      } else {
        favProducts.add(product);
        favProductsEncoded =
            favProducts.map((e) => jsonEncode(e).toString()).toList();
        await SharedPrefs().setStringList('favoriteList', favProductsEncoded);
      }
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }

  Future<List<ProductDetails>?> getFavoriteProducts() async {
    waiting = true;
    notifyListeners();
    List<ProductDetails>? favoriteProductsList = [];
    try {
      List<String>? favoriteProductsListEncoded =
          SharedPrefs().getStringList('favoriteList');
      favoriteProductsList = favoriteProductsListEncoded!
          .map((e) => ProductDetails.fromJson(jsonDecode(e)))
          .toList();
      favoriteProducts = favoriteProductsList;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
    return favoriteProductsList;
  }
}
