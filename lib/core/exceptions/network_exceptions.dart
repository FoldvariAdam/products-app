import 'package:products_app/core/exceptions/base_exceptions.dart';

class NetworkException extends AppException {
  NetworkException([super.message = 'Nincs internetkapcsolat']);
}

class ServerException extends AppException {
  ServerException([super.message = 'Szerverhiba történt']);
}
