import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class Result extends HomeEvent {
  final String query;

  const Result(this.query);
}
