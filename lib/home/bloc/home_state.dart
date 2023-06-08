import 'package:proyecto_final_bd/common/bloc/base_state.dart';

abstract class HomeState extends BaseState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {
  final List<dynamic> json;
  final String message;

  const HomeSuccess(
    this.json,
    this.message,
  );
}

class HomeError extends HomeState {
  final String error;

  const HomeError(
    this.error,
  );
}

class TableListSuccess extends HomeState {
  final Map<String, dynamic> tables;

  const TableListSuccess(
    this.tables,
  );
}

class TableListInProgress extends HomeState {}
