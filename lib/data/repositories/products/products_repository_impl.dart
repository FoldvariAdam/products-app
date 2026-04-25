import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/core/core.dart';
import 'package:products_app/data/data.dart';
import 'package:products_app/domain/domain.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiClient _productsApiClient;

  ProductsRepositoryImpl(this._productsApiClient);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = await _productsApiClient.getProducts();

      return products.toDomainList();
    } on DioException catch (e) {
      throw e.toException();
    } catch (_) {
      throw UnknownException();
    }
  }
}
