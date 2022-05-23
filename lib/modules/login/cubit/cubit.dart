import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/modules/login/cubit/states.dart';
import 'package:odc_app/shared/network/endPoints.dart';
import 'package:odc_app/shared/network/remote/dioHelper.dart';

class loginCubit extends Cubit<LoginState> {
  loginCubit() : super(LoginInitialState());
  static loginCubit get(context) => BlocProvider.of(context);
  void userLogin(String? email, String? password) {
    emit(LoginLodingState());
    DioHelper.postData(path: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(LoginSussessState());
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }


}
