import 'package:dio/dio.dart';
import 'package:proyecto_final_bd/factory/client_factory.dart';
import 'package:proyecto_final_bd/resources/api_uri.dart';

class HomeService {
  Dio client;

  HomeService()
      : client = ClientFactory.buildClient(
          baseUrl,
        );

  Future<Response> getResults({
    final String? query,
    final String? name,
    final String? password,
    final String? database,
  }) {
    return client.post(
      queryManagerPath,
      data: {
        'query': query,
        "username": name,
        "password": password,
        "database": database,
      },
    );
  }

  Future<Response> getTables({
    final String? name,
    final String? password,
    final String? database,
  }) {
    return client.post(
      tablesPath,
      data: {
        "username": name,
        "password": password,
        "database": database,
      },
    );
  }
}
