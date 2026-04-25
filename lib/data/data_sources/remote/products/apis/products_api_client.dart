import 'package:dio/dio.dart';
import 'package:products_app/data/data_sources/remote/products/models/product_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'products_api_client.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ProductsApiClient {
  factory ProductsApiClient(Dio dio, {String baseUrl}) = _ProductsApiClient;

  @GET('/products')
  Future<ProductsResponse> getProducts();
}