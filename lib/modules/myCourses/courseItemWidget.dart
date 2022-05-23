import 'package:flutter/material.dart';

Widget courseItem(String path, String title, String auther) {
  return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 254, 254),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                color: Color.fromARGB(60, 102, 102, 102),
                offset: Offset(1, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Image(
                image: AssetImage(path),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Text(
                    "Auther:$auther",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                print("object");
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 231, 231),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
