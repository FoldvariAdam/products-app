import 'base_exceptions.dart';

class NetworkException extends AppException {
  NetworkException([super.message = 'No internet connection']);
}

class ServerException extends AppException {
  ServerException([super.message = 'Server error']);
}
