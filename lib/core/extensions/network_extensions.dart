import 'package:dio/dio.dart';
import '../exceptions/base_exceptions.dart';
import '../exceptions/network_exceptions.dart';

extension DioExceptionX on DioException {
  AppException toException() {
    switch (type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return  NetworkException();

      case DioExceptionType.badResponse:
        return  ServerException();

      default:
        return  UnknownException();
    }
  }
}