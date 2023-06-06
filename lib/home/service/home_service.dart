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
  }) {
    return client.post(
      queryManagerPath,
      data: {
        'query': query,
        "username": "root",
        "password": "root",
        "database": "sakila"
      },
    );
  }
}
