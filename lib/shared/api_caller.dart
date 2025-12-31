import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';
import 'package:ostad_task_management/app.dart';
import 'package:ostad_task_management/auth/contorller/auth_controller.dart';
import 'package:ostad_task_management/auth/presentation/views/login_view.dart';

class ApiCaller {
  static final Logger _logger = Logger();

  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(
        uri,
        headers: {
          "content-type": "application/json",
          "token": AuthController.accessToken ?? "",
        },
      ); // actual get request to the server
      _logResponse(url, response);

      final int statusCode = response.statusCode;
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(statusCode: statusCode, body: data, isSccuess: true);
      } else if (statusCode == 401) {
        await _moveToLogin();
        return ApiResponse(
          statusCode: statusCode,
          body: null,
          isSccuess: false,
          error: "unauthorized",
        );
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

  static Future<void> _moveToLogin() async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
      App.navigator.currentContext!,
      MaterialPageRoute(builder: (context) => LoginView()),
      (route) => false,
    );
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
        headers: {
          "content-type": "application/json",
          "token": AuthController.accessToken ?? "",
        },
        body: jsonEncode(body),
      ); // actual get request to the server
      _logResponse(url, response);

      final int statusCode = response.statusCode;
      final data = jsonDecode(response.body);

      if (statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(statusCode: statusCode, body: data, isSccuess: true);
      } else if (statusCode == 401) {
        await _moveToLogin();
        return ApiResponse(
          statusCode: statusCode,
          body: null,
          isSccuess: false,
          error: "unauthorized",
        );
      } else {
        return ApiResponse(
          statusCode: statusCode,
          body: data,
          isSccuess: false,
          error: data["status"],
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
      "Body => ${body == null ? "No body provided" : (body.isEmpty ? "Empty body" : body)}",
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
