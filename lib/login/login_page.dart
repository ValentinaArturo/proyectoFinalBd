import 'package:flutter/material.dart';
import 'package:proyecto_final_bd/login/widget/login_body_desktop.dart';
import 'package:proyecto_final_bd/login/widget/login_body_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenTypeLayout.builder(
        desktop: (context) => const LoginBodyDesktop(),
        mobile: (context) => const LoginBodyMobile(),
      ),
    );
  }
}
