import 'package:dio/dio.dart';
import 'package:products_app/data/data_sources/remote/products/models/product_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'products_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ProductsRemoteDataSource {
  factory ProductsRemoteDataSource(Dio dio, {String baseUrl}) = _ProductsRemoteDataSource;

  @GET('/products')
  Future<ProductsResponse> getProducts();
}