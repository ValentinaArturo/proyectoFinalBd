import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_bd/home/bloc/home_bloc.dart';
import 'package:proyecto_final_bd/home/service/home_service.dart';
import 'package:proyecto_final_bd/home/widget/home_body_desktop.dart';
import 'package:proyecto_final_bd/home/widget/home_body_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        service: HomeService(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ScreenTypeLayout.builder(
          desktop: (context) => const HomeBodyDesktop(),
          mobile: (context) => const HomeBodyMobile(),
        ),
      ),
    );
  }
}
