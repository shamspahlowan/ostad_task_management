import 'package:flutter/material.dart';

class ShowSnackbarMessage {
  static void showSnackBarMessage(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content), duration: Duration(seconds: 3)),
    );
  }
}
