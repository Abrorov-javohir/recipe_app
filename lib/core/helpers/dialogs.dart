import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appdialogs {
  static bool isloading = false;
  static void showLoading(BuildContext context) {
    isloading = true;
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (isloading) {
      Navigator.of(context, rootNavigator: true).pop();
      isloading = false;
    }
  }
}
