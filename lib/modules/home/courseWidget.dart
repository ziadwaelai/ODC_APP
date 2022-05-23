import 'package:flutter/material.dart';

import '../../shared/styles/colorsStyle.dart';

Widget course(
    String url, String categorie, String title, String auther, String time) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 270,
          height: 150,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 221, 221, 221),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          categorie,
          style: TextStyle(color: defColor),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "$auther . $time",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
