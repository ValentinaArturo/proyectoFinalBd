import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_table/json_table.dart';
import 'package:proyecto_final_bd/common/animation/fade_animation.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/common/bloc/mixin/error_handling.dart';
import 'package:proyecto_final_bd/home/bloc/home_bloc.dart';
import 'package:proyecto_final_bd/home/bloc/home_event.dart';
import 'package:proyecto_final_bd/home/bloc/home_state.dart';

class HomeBodyDesktop extends StatefulWidget {
  const HomeBodyDesktop({Key? key}) : super(key: key);

  @override
  State<HomeBodyDesktop> createState() => _HomeBodyDesktopState();
}

class _HomeBodyDesktopState extends State<HomeBodyDesktop> with ErrorHandling {
  Color backgroundColor = const Color(
    0xFF003F5D,
  );
  TextEditingController commandController = TextEditingController();
  late HomeBloc _homeBloc;
  List<dynamic> json = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeBloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, BaseState>(
      listener: (
        context,
        state,
      ) async {
        verifyServerError(state);
        if (state is HomeSuccess) {
          setState(() {
            json = state.json;
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
            child: Row(
              children: [
                Drawer(
                  backgroundColor: Colors.transparent,
                  child: ListView(
                    children: const [
                      ExpansionTile(
                        title: Text(
                          "Tabla 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        children: <Widget>[
                          Text("children 1"),
                          Text("children 2")
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          "Tabla 2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        children: <Widget>[
                          Text("children 1"),
                          Text("children 2")
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          "Tabla 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        children: <Widget>[
                          Text("children 1"),
                          Text("children 2")
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.all(
                          5.0,
                        ),
                        child: TextField(
                          controller: commandController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: 'Escribe aqui.......',
                            hintStyle: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 25,
                            ),
                            suffixIcon: GestureDetector(
                              child: const Icon(
                                Icons.flash_on,
                                color: Colors.indigo,
                              ),
                              onTap: () {
                                _homeBloc.add(
                                  Result(
                                    commandController.text,
                                  ),
                                );
                              },
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.white.withOpacity(0.7),
                        padding: const EdgeInsets.all(
                          5.0,
                        ),
                        child: json.isEmpty ? Container() : _jsonTable(json),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<HomeBloc, BaseState>(
            builder: (context, state) {
              if (state is HomeInProgress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                );
              } else if (state is HomeError) {
                setState(() {});
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                });
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _jsonTable(
    var json,
  ) {
    return JsonTable(
      json,
      tableHeaderBuilder: (String? header) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            color: Colors.indigo[900],
          ),
          child: Text(
            header!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        );
      },
      tableCellBuilder: (value) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 2.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.grey.withOpacity(
                0.5,
              ),
            ),
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[900],
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
