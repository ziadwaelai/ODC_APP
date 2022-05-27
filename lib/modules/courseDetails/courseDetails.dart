import 'package:flutter/material.dart';
import 'package:odc_app/layout/cubit/cubit.dart';
import 'package:odc_app/models/courseModel.dart';
import 'package:odc_app/shared/styles/fontStyles.dart';

import '../../shared/styles/CustomButtom.dart';

class CourseDetails extends StatelessWidget {
  final CoursModel model;
  final int i;

  const CourseDetails({Key? key, required this.model, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: 400,
              height: 250,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      (model.data![i].imageUrl as String),
                      height: 250.0,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(65, 178, 178, 178),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                model.data![i].courseName as String,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Author:${model.data![i].admin!.adminName as String}",
                style: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
              ),
            ),
            customButtomTwo(
                context, AppCubit.get(context).ShowSnakeBar, "Start Course"),
            Text(
              "About this Course",
              style: homeTitlsStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Welcome to your UX Design for Beginners Course. In the following tutorials, you'll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer. ",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/Level.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  model.data![i].courseLevel as String,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/location.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Cairo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
