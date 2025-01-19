//https://pub.dev/packages/http_interceptor
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:playground/src/features/data/dto/api_error.dart';

import '../string_constant.dart';

class ApiInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    const key = StringConstant.apiKey;
    try {
      final newUri = request.url.replace(
        queryParameters: {
          ...request.url.queryParameters, // Include existing query parameters
          'api_key': key, // Add the new parameter
        },
      );
      request.headers[HttpHeaders.contentTypeHeader] = "application/json";
      final newRequest = http.Request(request.method, newUri)
        ..headers.addAll(request.headers)
        ..bodyBytes = await request.finalize().toBytes();
      return newRequest;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    if (response is Response) {
      if (response.statusCode != 200) {
        final json = jsonDecode((response).body);
        throw ApiException(response.statusCode,
            json['status_message'] ?? "Something when wrong");
      }
    }
    return response;
  }
}
