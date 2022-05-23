import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/layout/cubit/states.dart';
import 'package:odc_app/modules/account/accountScreen.dart';
import 'package:odc_app/modules/home/homeScreen.dart';

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

  void ShowSnakeBar(){}
}
