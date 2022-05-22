import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';

Widget customButtom(context, screen, String text) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(defColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: defColor))))),
  );
}
