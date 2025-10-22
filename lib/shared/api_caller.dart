import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/web.dart';

class ApiCaller {
  static final Logger _logger = Logger();
  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(uri); // actual get request to the server
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

  static Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(body),
      ); // actual get request to the server
      _logResponse(url, response);

      final int statusCode = response.statusCode;
      final data = jsonDecode(response.body);

      if (statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(statusCode: statusCode, body: data, isSccuess: true);
      } else {
        return ApiResponse(
          statusCode: statusCode,
          body: data,
          isSccuess: false,
          error: data["data"],
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

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      "Url => $url"
      "Body => ${body!.isEmpty ? "No data was provided" : body}",
    );
  }

  static void _logResponse(String url, Response response) {
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
