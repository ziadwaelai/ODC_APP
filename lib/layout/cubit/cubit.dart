import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/layout/cubit/states.dart';
import 'package:odc_app/models/courseModel.dart';
import 'package:odc_app/modules/account/accountScreen.dart';
import 'package:odc_app/modules/home/homeScreen.dart';
import 'package:odc_app/modules/login/loginScreen.dart';
import 'package:odc_app/shared/network/endPoints.dart';
import 'package:odc_app/shared/network/local/cacheHelper.dart';
import 'package:odc_app/shared/network/remote/dioHelper.dart';

import '../../modules/myCourses/MyCoursesScreen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(Icons.library_books_rounded), label: "."),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: ""),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<Widget> screens = [HomeScreen(), MyCoursesScreen(), AccountScreen()];

  void ShowSnakeBar() {}

  void subimtToLogin(context) {
    CacheHelper.saveData(key: 'onBoarding', value: false).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LogInScreen(),
          ),
          (route) {
            return false;
          },
        );
      }
      ;
    });
  }

  CoursModel ?coursModel;
  void getCourses() {
    emit(CourseLodingState());
    DioHelper.getData(url: COURSES, token: CacheHelper.getData(key: "Token"))
        .then((value) {
       coursModel = CoursModel.fromJson(value.data);
      print(coursModel!.data![1]);
      emit(CourseSuccesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(CourseErroState());
    });
  }
}
