import 'package:flutter/material.dart';

Widget CustomTextFormFild(String label, TextEditingController? controller) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(108, 224, 224, 224),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextFormField(
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
              ))));
}
