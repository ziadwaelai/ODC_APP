import 'package:flutter/material.dart';
import 'package:odc_app/models/courseModel.dart';
import 'package:odc_app/modules/courseDetails/courseDetails.dart';

import '../../shared/styles/colorsStyle.dart';

Widget course(CoursModel model, int i, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CourseDetails(model: model, i: i)));
    },
    child: Padding(
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
              image: NetworkImage(model.data![i].imageUrl as String),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            model.data![i].category!.categoryName as String,
            style: TextStyle(color: defColor),
          ),
          Text(
            model.data![i].courseName as String,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            "${model.data![i].admin!.adminName as String} . ${model.data![i].createdAt as String}",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
