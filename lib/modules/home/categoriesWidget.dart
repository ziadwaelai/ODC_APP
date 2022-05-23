import 'package:flutter/material.dart';

Widget categories(String path, String subTitle) {
  return Column(
    children: [
      Container(
        width: 73,
        height: 73,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Color.fromARGB(60, 102, 102, 102),
                  offset: Offset(1, 1))
            ]),
        child: Image(image: AssetImage(path)),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        subTitle,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
      )
    ],
  );
}
