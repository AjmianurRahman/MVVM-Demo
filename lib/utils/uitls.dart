import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  //? Toast
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //? FlushBar
  static flushBarError(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.red.shade700,
        reverseAnimationCurve: Curves.easeInOut,
        message: message,
        borderRadius: BorderRadius.circular(16),
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        duration: Duration(seconds: 2),
      )..show(context),
    );
  }
  //? FlushBar
  static successFlushBarError(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.green.shade700,
        reverseAnimationCurve: Curves.easeInOut,
        message: message,
        borderRadius: BorderRadius.circular(16),
        positionOffset: 20,
        icon: Icon(
          Icons.done,
          color: Colors.white,
        ),
        duration: Duration(seconds: 2),
      )..show(context),
    );
  }

  //? SnackBar
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.black, content: Text(message)));
  }
}
