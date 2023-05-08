import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';

abstract class BaseBloc<T, R> extends Bloc<T, R> {
  BaseBloc(initialState) : super(initialState);

  Stream<BaseState> handleNetworkError(
    final dynamic exception,
    Emitter<BaseState> emit,
  ) async* {
    if (exception.statusCode == 403) {
      emit(
        AuthorizationError(),
      );
    } else if (exception.statusCode >= 300 && exception.statusCode < 500) {
      emit(
        ServerClientError(
          exception.statusDescription,
        ),
      );
    } else if (exception.statusCode >= 500) {
      emit(
        UnknownError(
          exception.statusDescription,
        ),
      );
    } else {
      emit(
        const ServerClientError(
          'KnowError',
        ),
      );
    }
  }
}
