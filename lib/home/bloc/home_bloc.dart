import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:proyecto_final_bd/common/bloc/base_bloc.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/home/bloc/home_event.dart';
import 'package:proyecto_final_bd/home/bloc/home_state.dart';
import 'package:proyecto_final_bd/home/service/home_service.dart';

class HomeBloc extends BaseBloc<HomeEvent, BaseState> {
  final HomeService service;

  HomeBloc({
    required this.service,
  }) : super(HomeInitial()) {
    on<Result>(
      getResult,
    );
  }

  Future<void> getResult(
    final Result event,
    Emitter<BaseState> emit,
  ) async {
    emit(
      HomeInProgress(),
    );
    try {
      final Response response = await service.getResults(
        query: event.query,
      );
      if (response.data['status'] == 200) {
        emit(
          HomeSuccess(
            response.data['results'],
          ),
        );
      } else {
        emit(
          HomeError(
            response.data['msg'].toString(),
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
