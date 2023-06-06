import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:proyecto_final_bd/common/bloc/base_bloc.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/login/bloc/login_event.dart';
import 'package:proyecto_final_bd/login/bloc/login_state.dart';
import 'package:proyecto_final_bd/login/service/login_service.dart';

class LoginBloc extends BaseBloc<LoginEvent, BaseState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>(
      login,
    );
  }

  Future<void> login(
    final Login event,
    Emitter<BaseState> emit,
  ) async {
    emit(
      LoginInProgress(),
    );
    try {
      final loginService = LoginService();

      final Response response = await loginService.login(
        name: event.user,
        password: event.password,
        database: event.database,
      );
      final body = json.decode(response.data);
      if (body['statusCode'] == 200) {
        emit(
          LoginSuccess(),
        );
      } else {
        emit(
            LoginError(
              body['message'].toString(),
            ),
        );
      }
    } on DioError catch (dioError) {
      handleNetworkError(
        dioError,
        emit,
      );
    }
  }
}
