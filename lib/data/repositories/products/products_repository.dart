import 'package:products_app/domain/domain.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
