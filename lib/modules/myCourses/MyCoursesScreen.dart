import 'package:flutter/material.dart';
import 'package:odc_app/modules/myCourses/courseItemWidget.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Courses",
          style: TextStyle(
              color: defColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            courseItem("assets/images/onBording1.png",
                "Learn UI/UX for Beginners", "ziad"),
            courseItem("assets/images/onBording1.png",
                "Learn UI/UX for Beginners", "ziad"),
            courseItem("assets/images/onBording1.png",
                "Learn UI/UX for Beginners", "ziad")
          ],
        ),
      ),
    );
  }
}
