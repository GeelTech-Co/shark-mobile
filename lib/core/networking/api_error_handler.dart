import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to the server was cancelled');
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: 'Connection to server failed due to internet connection',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive timeout with the server');
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send timeout with the server');
        default:
          return ApiErrorModel(message: 'Something went wrong');
      }
    } else {
      return ApiErrorModel(message: 'Unknown error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  try {
    bool? status = data['status'] is bool ? data['status'] : null;
    String? message = data['message']?.toString();

    Map<String, List<String>>? response;
    if (data['response'] is Map) {
      response = (data['response'] as Map).map(
        (key, value) => MapEntry(key.toString(), List<String>.from(value)),
      );
    }

    return ApiErrorModel(status: status, message: message, response: response);
  } catch (e) {
    return ApiErrorModel(message: 'Failed to parse error response');
  }
}
