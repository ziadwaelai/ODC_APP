import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/models/loginModel.dart';
import 'package:odc_app/modules/login/cubit/states.dart';
import 'package:odc_app/shared/network/endPoints.dart';
import 'package:odc_app/shared/network/remote/dioHelper.dart';

import '../../../layout/layout.dart';

class loginCubit extends Cubit<LoginState> {
  loginCubit() : super(LoginInitialState());
  static loginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void userLogin(String? email, String? password, context) {
    emit(LoginLodingState());
    DioHelper.postData(path: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      emit(LoginSussessState(userModel));
      userModel = UserModel.fromJson(value.data);
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError.toString()));
    });
  }
}
