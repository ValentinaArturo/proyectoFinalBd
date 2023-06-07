import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_bd/common/animation/fade_animation.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';
import 'package:proyecto_final_bd/common/bloc/mixin/error_handling.dart';
import 'package:proyecto_final_bd/home/bloc/home_bloc.dart';
import 'package:proyecto_final_bd/home/bloc/home_event.dart';
import 'package:proyecto_final_bd/home/bloc/home_state.dart';

class HomeBodyMobile extends StatefulWidget {

  const HomeBodyMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBodyMobile> createState() => _HomeBodyMobileState();
}

class _HomeBodyMobileState extends State<HomeBodyMobile> with ErrorHandling {
  Color backgroundColor = const Color(
    0xFF1F1A30,
  );
  TextEditingController commandController = TextEditingController();
  bool isOpen = false;
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isOpen
                    ? Drawer(
                        backgroundColor: Colors.transparent,
                        child: ListView(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOpen = false;
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const ExpansionTile(
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
                            const ExpansionTile(
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
                            const ExpansionTile(
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
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isOpen = true;
                          });
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                Column(
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: isOpen
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.width * 0.7,
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
                                setState(() {
                                  json.clear();
                                });
                                _homeBloc.add(
                                  Result(
                                    query: commandController.text,

                                  ),
                                );
                              },
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: isOpen
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: const EdgeInsets.all(
                          5.0,
                        ),
                        child: isOpen
                            ? Container()
                            : DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Age',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Role',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: const <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Sarah',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      DataCell(Text(
                                        '19',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                      DataCell(Text(
                                        'Student',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                        'Janine',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                      DataCell(Text(
                                        '43',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                      DataCell(Text(
                                        'Professor',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                        'William',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                      DataCell(Text(
                                        '27',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                      DataCell(Text(
                                        'Associate Professor',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
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
                return const CircularProgressIndicator();
              } else if (state is HomeError) {
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
