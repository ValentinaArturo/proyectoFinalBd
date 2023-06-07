import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_bd/login/bloc/login_bloc.dart';
import 'package:proyecto_final_bd/login/widget/login_body_desktop.dart';
import 'package:proyecto_final_bd/login/widget/login_body_mobile.dart';
import 'package:proyecto_final_bd/repository/user_repository.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        repository: UserRepository(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ScreenTypeLayout.builder(
          desktop: (context) => const LoginBodyDesktop(),
          mobile: (context) => const LoginBodyMobile(),
        ),
      ),
    );
  }
}
