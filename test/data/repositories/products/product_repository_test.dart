import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:products_app/core/exceptions/base_exceptions.dart';
import 'package:products_app/core/exceptions/network_exceptions.dart';
import 'package:products_app/data/data.dart';

import '../../../mocks/generate_mocks.mocks.dart';

void main() {
  late ProductsRepositoryImpl repository;
  late MockProductsRemoteDataSource remote;
  late MockFavoritesLocalDataSource local;

  setUp(() {
    remote = MockProductsRemoteDataSource();
    local = MockFavoritesLocalDataSource();

    repository = ProductsRepositoryImpl(remote, local);
  });

  test('getProducts returns mapped domain products with favorites', () async {
    final mockProducts = MockProductsResponse();
    final mockProduct = MockProductResponse();
    when(remote.getProducts()).thenAnswer(
          (_) async => mockProducts
    );

    when(mockProducts.products).thenReturn([mockProduct]);
    when(mockProduct.id).thenReturn(1);

    when(local.getFavorites()).thenAnswer((_) async => {1});

    final result = await repository.getProducts();

    expect(result.length, 1);
    expect(result.first.isFavorite, true);
  });

  test('getProducts throws ServerException when DioException occurs', () async {
    final dioException = DioException(
      requestOptions: RequestOptions(path: '/products'),
      type: DioExceptionType.badResponse,
    );

    when(remote.getProducts()).thenThrow(dioException);

    await expectLater(
          () => repository.getProducts(),
      throwsA(isA<ServerException>()),
    );
  });

  test('getProducts throws UnknownException when unexpected error occurs', () async {
    when(remote.getProducts()).thenThrow(Exception('Unknown error'));

    expect(() => repository.getProducts(), throwsA(isA<UnknownException>()));
  });

  test('toggleFavorite adds id to favorites when not present', () async {
    when(local.getFavorites()).thenAnswer((_) async => <int>{});

    await repository.toggleFavorite(1);

    verify(local.saveFavorites({1})).called(1);
  });

  test('toggleFavorite removes id from favorites when already present', () async {
    when(local.getFavorites()).thenAnswer((_) async => <int>{1, 2});

    await repository.toggleFavorite(1);

    verify(local.saveFavorites({2})).called(1);
  });
}
