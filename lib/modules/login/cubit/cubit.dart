import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/models/loginModel.dart';
import 'package:odc_app/modules/login/cubit/states.dart';
import 'package:odc_app/shared/network/endPoints.dart';
import 'package:odc_app/shared/network/local/cacheHelper.dart';
import 'package:odc_app/shared/network/remote/dioHelper.dart';

class loginCubit extends Cubit<LoginState> {
  loginCubit() : super(LoginInitialState());
  static loginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  String message = "";
  void userLogin(String? email, String? password, context) {
    String TOKEN;
    emit(LoginLodingState());
    DioHelper.postData(path: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      // message = value.data["message"];
      emit(LoginSussessState(userModel));
      TOKEN = value.data["data"]["access_token"];
      CacheHelper.saveData(key: "Token", value: TOKEN);
      // userModel = UserModel.fromJson(value.data);
    }).catchError((onError) {
      // if (onError is DioError) {
      //   message = onError.response?.data["message"];
      //   print()
      // } else {
      emit(LoginErrorState(onError.toString()));
      // }
    });
  }
}
