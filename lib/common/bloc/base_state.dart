import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class InitialState extends BaseState {}

class ServerClientError extends BaseState {
  final String error;

  const ServerClientError(
    this.error,
  );
}

class AuthorizationError extends BaseState {}

class UnknownError extends BaseState {
  final String error;

  const UnknownError(
    this.error,
  );
}
