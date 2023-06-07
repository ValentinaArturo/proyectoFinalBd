import 'package:dio/dio.dart';
import 'package:proyecto_final_bd/factory/client_factory.dart';
import 'package:proyecto_final_bd/resources/api_uri.dart';

class LoginService {
  Dio client;

  LoginService()
      : client = ClientFactory.buildClient(
          baseUrl,
        );

  Future<Response> login({
    final String? name,
    final String? password,
    final String? database,
  }) {
    return client.post(
      loginPath,
      data: {
        "username": name,
        "password": password,
        "database": database,
      },
    );
  }

  Future<Response> getSchemes({
    final String? name,
    final String? password,
  }) {
    return client.post(
      schemePath,
      data: {
        "username": name,
        "password": password,
      },
    );
  }
}
