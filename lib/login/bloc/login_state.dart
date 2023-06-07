import 'package:proyecto_final_bd/common/bloc/base_state.dart';

abstract class LoginState extends BaseState {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String error;

  const LoginError(this.error);
}

class SchemeListSuccess extends LoginState {
  final List<String> schemes;

  const SchemeListSuccess(this.schemes);
}
class SchemeListProgress extends LoginState {}
