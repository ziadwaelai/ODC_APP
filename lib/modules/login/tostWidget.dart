import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/styles/colorsStyle.dart';

tost({required String text, bool error = false}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: !error ? defColor : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
