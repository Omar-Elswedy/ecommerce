import '../product/model/data_sources/product_api_data_source.dart';
import '../product/model/data_sources/product_data_source.dart';

class ServiceLocator {
  static ProductDataSource productDataSource = ProductAPIDataSource();
}
