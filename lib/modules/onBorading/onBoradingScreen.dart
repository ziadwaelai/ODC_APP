import 'package:flutter/material.dart';
import 'package:odc_app/layout/cubit/cubit.dart';
import 'package:odc_app/modules/onBorading/onBoardingItem.dart';
import 'package:odc_app/modules/onBorading/onBordingModel.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login/loginScreen.dart';
import '../register/registerScreen.dart';

class OnBordingScreen extends StatefulWidget {
  @override
  _OnBordingScreen createState() => _OnBordingScreen();
}

class _OnBordingScreen extends State<OnBordingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onBording1.png',
    ),
    BoardingModel(
      image: 'assets/images/onBording2.png',
    ),
    BoardingModel(
      image: 'assets/images/onBording3.png',
    ),
  ];

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SmoothPageIndicator(
              controller: boardController,
              effect: ScaleEffect(
                dotColor: Colors.grey,
                activeDotColor: defColor,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 5.0,
              ),
              count: boarding.length,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      "Join Now",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: defColor,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        AppCubit.get(context).subimtToLogin(context);
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: defColor),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 255, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: defColor))))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
