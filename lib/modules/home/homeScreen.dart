import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/layout/cubit/cubit.dart';
import 'package:odc_app/layout/cubit/states.dart';
import 'package:odc_app/models/courseModel.dart';
import 'package:odc_app/modules/home/categoriesWidget.dart';
import 'package:odc_app/modules/home/courseWidget.dart';
import 'package:odc_app/shared/network/local/cacheHelper.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';
import '../../shared/styles/fontStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Logo4.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 0,
                              color: defColor,
                              offset: Offset(0, 4))
                        ] // Make rounded corner of border
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Enter the Code to Get your course",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 220,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(108, 224, 224, 224),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: TextFormField(
                                          obscureText: false,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Enter Code',
                                              labelStyle: TextStyle(
                                                  color: Colors.white54))))),
                              Spacer(),
                              FloatingActionButton(
                                onPressed: () {
                                  print(CacheHelper.getData(key: "Token"));
                                  AppCubit.get(context).getCourses();
                                },
                                child: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                backgroundColor: defColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Top Categories", style: homeTitlsStyle),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text("See all", style: homeSubTitleStyle))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // use whichever suits your need
                    children: [
                      categories("assets/images/Vector.png", "Web Development"),
                      categories(
                          "assets/images/Vector2.png", "Programing Languages"),
                      categories("assets/images/Vector3.png", "Graphics"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "New Courses",
                    style: homeTitlsStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.coursModel!.data!.length,
                        itemBuilder: (
                          context,
                          i,
                        ) {
                          if (cubit.coursModel == null) {
                            return CircularProgressIndicator();
                          } else {
                            return course(
                                cubit.coursModel as CoursModel, i, context);
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}
