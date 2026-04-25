import 'package:injectable/injectable.dart';
import 'package:products_app/data/repositories/products/products_repository.dart';
import 'package:products_app/domain/products/models/product.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProducts() {
    throw UnimplementedError();
  }
}