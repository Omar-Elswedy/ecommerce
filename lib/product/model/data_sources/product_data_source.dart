import 'package:ecommerce/product/model/data_model/product_details.dart';

abstract class ProductDataSource {
  Future<List<ProductDetails>?> getAllProducts();
  Future<ProductDetails?> getProductDetails(int productId);
}
