import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}
// For server/API errors
class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout. Please try again.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Request timeout. Please try again.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Server is taking too long to respond.");

      case DioExceptionType.badResponse:
        return ServerFailure._fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
          "No internet connection. Please check your network.",
        );

      case DioExceptionType.badCertificate:
        return ServerFailure("Security certificate error.");

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure("No internet connection.");
        }
        return ServerFailure("Unexpected error occurred. Please try again.");
    }
  }

  factory ServerFailure._fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure("Bad request. Please try again.");
      case 401:
        return ServerFailure("Unauthorized. Please login again.");
      case 403:
        return ServerFailure("Access forbidden.");
      case 404:
        return ServerFailure("The requested resource was not found.");
      case 408:
        return ServerFailure("Request timeout. Please try again.");
      case 429:
        return ServerFailure("Too many requests. Please try again later.");
      case 500:
        return ServerFailure("Server error. Please try again later.");
      case 502:
        return ServerFailure("Bad gateway. Please try again.");
      case 503:
        return ServerFailure("Service unavailable. Please try again later.");
      default:
        return ServerFailure("Received error: $statusCode");
    }
  }
}

// For local cache/database errors
class CacheFailure extends Failure {
  CacheFailure(String errorMessage) : super(errorMessage);
}

// For network-specific errors
class NetworkFailure extends Failure {
  NetworkFailure(String errorMessage) : super(errorMessage);
}
