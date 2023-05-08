import 'package:flutter/material.dart';
import 'package:proyecto_final_bd/login/login_page.dart';
import 'package:proyecto_final_bd/routes/landing_routes_constants.dart';

class LandingRoutes {
  static Route<dynamic> generateRouteLanding(final RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
