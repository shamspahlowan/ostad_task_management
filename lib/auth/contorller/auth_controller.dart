import 'dart:convert';
import 'package:ostad_task_management/util/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const String _accessToken = "token";
  static const String _userModel = "user";
  // static final Logger _logger = Logger();

  static String? accessToken;
  static UserModel? userModel;
  static Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessToken, token);
    await sharedPreferences.setString(_userModel, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
    // _showModel(accessToken!, model);
  }

  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessToken);
    if (token != null) {
      final String? userData = sharedPreferences.getString(_userModel);
      userModel = UserModel.fromJson(jsonDecode(userData!));
      accessToken = token;
    }
  }

  // static void _showModel(String token, UserModel model) {
  //   AuthController._logger.i(
  //     "accessToken => $token"
  //     "user => ${model.toString()}",
  //   );
  // }

  static Future<bool> isUserAlreadyLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessToken);
    return token != null;
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
