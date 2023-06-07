import 'package:flutter/material.dart';
import 'package:proyecto_final_bd/home/home_page.dart';
import 'package:proyecto_final_bd/login/login_page.dart';
import 'package:proyecto_final_bd/routes/generator_route.dart';
import 'package:proyecto_final_bd/routes/landing_routes_constants.dart';

class LandingRoutes {
  static Route<dynamic> generateRouteLanding(final RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return GeneratePageRoute(
          widget: const LoginPage(),
          routeName: settings.name!,
        );
      case loginRoute:
        return GeneratePageRoute(
          widget: const LoginPage(),
          routeName: settings.name!,
        );
      case homeRoute:
        return GeneratePageRoute(
          widget: const HomePage(),
          routeName: settings.name!,
        );
      default:
        return GeneratePageRoute(
          widget: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          routeName: '',
        );
    }
  }
}
