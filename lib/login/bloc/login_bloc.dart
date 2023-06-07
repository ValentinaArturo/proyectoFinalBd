import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:proyecto_final_bd/common/bloc/base_bloc.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/login/bloc/login_event.dart';
import 'package:proyecto_final_bd/login/bloc/login_state.dart';
import 'package:proyecto_final_bd/login/service/login_service.dart';
import 'package:proyecto_final_bd/repository/user_repository.dart';

class LoginBloc extends BaseBloc<LoginEvent, BaseState> {
  LoginBloc({
    required this.repository,
  }) : super(LoginInitial()) {
    on<Login>(
      login,
    );
    on<SchemeList>(
      getSchemeList,
    );
  }

  final UserRepository repository;

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
        await repository.setName(event.user);
        await repository.setPassword(event.password);
        await repository.setScheme(event.database);
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

  Future<void> getSchemeList(
    final SchemeList event,
    Emitter<BaseState> emit,
  ) async {
    emit(
      SchemeListProgress(),
    );
    try {
      final loginService = LoginService();

      final Response response = await loginService.getSchemes(
        name: event.user,
        password: event.password,
      );
      final body = json.decode(response.data);
      if(body != []) {
        List<String>? schemes = (body as List).map((item) => item as String).toList();
        emit(
        SchemeListSuccess(schemes),
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
