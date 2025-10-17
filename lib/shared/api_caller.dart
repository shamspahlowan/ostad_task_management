import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/web.dart';

class ApiCaller {
  final Logger _logger = Logger();
  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(uri);
      _logResponse(url, response);

      final int statusCode = response.statusCode;
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(statusCode: statusCode, body: data, isSccuess: true);
      } else {
        return ApiResponse(
          statusCode: statusCode,
          body: data,
          isSccuess: false,
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        statusCode: -1,
        body: null,
        isSccuess: false,
        error: e.toString(),
      );
    }
  }

  void _logRequest(String url) {
    _logger.i("Url => $url");
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      "Url => $url\n"
      "status code => ${response.statusCode}\n"
      "Body => ${response.body}",
    );
  }
}

class ApiResponse {
  final bool isSccuess;
  final int statusCode;
  final dynamic body;
  final String? error;

  ApiResponse({
    required this.statusCode,
    required this.body,
    this.error,
    required this.isSccuess,
  });
}
