import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_bd/common/animation/fade_animation.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/common/bloc/mixin/error_handling.dart';
import 'package:proyecto_final_bd/login/bloc/login_bloc.dart';
import 'package:proyecto_final_bd/login/bloc/login_event.dart';
import 'package:proyecto_final_bd/login/bloc/login_state.dart';
import 'package:proyecto_final_bd/login/enum/form_data.dart';
import 'package:proyecto_final_bd/routes/landing_routes_constants.dart';

class LoginBodyDesktop extends StatefulWidget {
  const LoginBodyDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBodyDesktop> createState() => _LoginBodyDesktopState();
}

class _LoginBodyDesktopState extends State<LoginBodyDesktop>
    with ErrorHandling {
  late LoginBloc _loginBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginBloc = context.read<LoginBloc>();
  }

  Color enabled = const Color.fromARGB(
    255,
    63,
    56,
    89,
  );
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(
    0xFF003F5D,
  );
  bool ispasswordev = true;
  FormData? selected;
  String? dropdownValue = 'Selecciona un esquema';
  List<String> items = [
    'Selecciona un esquema',
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController schemeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, BaseState>(
      listener: (
        context,
        state,
      ) async {
        verifyServerError(state);
        if (state is LoginSuccess) {
          Navigator.pushNamed(
            context,
            homeRoute,
          );
        } else if (state is SchemeListSuccess) {
          setState(() {
            items.addAll(state.schemes);
          });
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/waves_home.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.lightBlue.withOpacity(0.2),
                      child: Container(
                        width: 800,
                        height: 800,
                        padding: const EdgeInsets.all(
                          40.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeAnimation(
                              delay: 0.8,
                              child: Image.asset(
                                'assets/mysql.png',
                                width: 200,
                                height: 200,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: const Text(
                                "Ingrese los datos para continuar",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(
                                  5.0,
                                ),
                                child: TextField(
                                  controller: nameController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Email;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Usuario',
                                    hintStyle: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12,
                                    ),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                  color: selected == FormData.password
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(
                                  5.0,
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.password;
                                    });
                                  },
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        dropdownValue = 'Selecciona un esquema';
                                        items.clear();
                                        items.add('Selecciona un esquema');
                                      });

                                    }
                                    _loginBloc.add(
                                      SchemeList(
                                        user: nameController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: ispasswordev
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              ),
                                        onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                      ),
                                      hintText: 'Contraseña',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              : deaible,
                                          fontSize: 12)),
                                  obscureText: ispasswordev,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                  color: selected == FormData.scheme
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(
                                  5.0,
                                ),
                                child: TextField(
                                  controller: schemeController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.scheme;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.format_align_center,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    suffixIcon: Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: backgroundColor,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          value: dropdownValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: items
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 35),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      color: selected ==
                                                              FormData.scheme
                                                          ? enabledtxt
                                                          : deaible,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    dropdownValue = value;
                                                    selected = FormData.scheme;
                                                  });
                                                  print(dropdownValue);
                                                });
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: TextButton(
                                onPressed: () {
                                  _loginBloc.add(
                                    Login(
                                      user: nameController.text,
                                      database: dropdownValue!,
                                      password: passwordController.text,
                                    ),
                                  );
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   homeRoute,
                                  // );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFF2697FF,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14.0,
                                    horizontal: 80,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<LoginBloc, BaseState>(
            builder: (context, state) {
              if (state is LoginInProgress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is LoginError) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
