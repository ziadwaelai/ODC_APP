import 'package:odc_app/models/loginModel.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLodingState extends LoginState {}

class LoginSussessState extends LoginState {
  final _userModel;

  LoginSussessState(this._userModel);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
