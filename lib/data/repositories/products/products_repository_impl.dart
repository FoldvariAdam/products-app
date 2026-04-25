import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/core/core.dart';
import 'package:products_app/data/data.dart';
import 'package:products_app/domain/domain.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  late final FavoritesLocalDataSource _favoritesLocalDataSource;

  ProductsRepositoryImpl(
    this._productsRemoteDataSource,
    this._favoritesLocalDataSource,
  );

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = await _productsRemoteDataSource.getProducts();
      final favorites = await _favoritesLocalDataSource.getFavorites();

      return products.toDomainList(favorites);
    } on DioException catch (e) {
      throw e.toException();
    } catch (e) {
      throw UnknownException();
    }
  }

  @override
  Future<void> toggleFavorite(int id) async {
    final current = await _favoritesLocalDataSource.getFavorites();

    final updated = Set<int>.from(current);

    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }

    await _favoritesLocalDataSource.saveFavorites(updated);
  }

  @override
  Future<Set<int>> getFavorites() => _favoritesLocalDataSource.getFavorites();
}
