import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.black,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 100,
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
