import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/data/data.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    return dio;
  }

  @lazySingleton
  ProductsRemoteDataSource productsRemoteDataSource(Dio dio) => ProductsRemoteDataSource(dio);
}
