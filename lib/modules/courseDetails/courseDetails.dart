import 'package:flutter/material.dart';
import 'package:odc_app/layout/cubit/cubit.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';
import 'package:odc_app/shared/styles/fontStyles.dart';

import '../../shared/styles/CustomButtom.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              alignment: Alignment.center,
              width: 400,
              height: 250,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/onBording1.png"),
                    fit: BoxFit.cover,
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
            Center(
              child: Text(
                "Learn UI/UX for beginners",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Author: Ahmed Abaza",
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
          ],
        ),
      )),
    );
  }
}
