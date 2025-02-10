import 'package:ecommerce/product/model/data_model/product_details.dart';
import 'package:ecommerce/product/model/data_sources/product_data_source.dart';

class ProductRepository {
  final ProductDataSource productDataSource;
  ProductRepository(this.productDataSource);

  Future<List<ProductDetails>?> getAllProducts() async {
    List<ProductDetails>? products = await productDataSource.getAllProducts();
    return products;
  }

  // Future<ProductDetails?> getProducts(int productId) async {
  //   ProductDetails? productDetails =
  //       await productDataSource.getProductDetails(productId);
  //   return productDetails;
  // }
}
