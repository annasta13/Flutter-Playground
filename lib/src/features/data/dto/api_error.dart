import 'package:http/http.dart';

class ApiError {
  final int statusCode;
  final String message;

  ApiError({required this.statusCode, required this.message});

  static const int parsingErrorCode = 5213;
}

class ParsingException extends ClientException {
  ParsingException(super.message);
}

class ApiException implements Exception {
  final int code;
  final String message;

  ApiException(this.code, this.message);

  @override
  String toString() => 'ApiException(code: $code, message: $message)';
}

ApiError handleApiError(Object e) {
  if (e is ApiException) {
    return ApiError(statusCode: e.code, message: e.message);
  } else if (e is Exception) {
    return ApiError(
      statusCode: 500,
      message: e.toString(),
    ); // General Exception
  } else {
    return ApiError(
      statusCode: 500,
      message: "An unknown error occurred.",
    );
  }
}
