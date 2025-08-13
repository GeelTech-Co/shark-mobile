import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showCustomToast(
  String message, {
  bool isSuccess = true,
  String? backendMessage,
}) {
  String finalMessage = message;

  if (backendMessage != null && backendMessage.trim().isNotEmpty) {
    finalMessage += "\n$backendMessage";
  }

  Fluttertoast.showToast(
    msg: finalMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
