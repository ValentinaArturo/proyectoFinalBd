import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final String user;
  final String password;
  final String database;

  const Login({
    required this.user,
    required this.password,
    required this.database,
  });
}

class SchemeList extends LoginEvent {
  final String user;
  final String password;

  const SchemeList({
    required this.user,
    required this.password,
  });
}
