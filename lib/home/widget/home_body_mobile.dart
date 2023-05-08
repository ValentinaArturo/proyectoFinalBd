import 'package:flutter/material.dart';
import 'package:proyecto_final_bd/common/animation/fade_animation.dart';
import 'package:proyecto_final_bd/resources/colors.dart';

class HomeBodyMobile extends StatefulWidget {
  const HomeBodyMobile({Key? key}) : super(key: key);

  @override
  State<HomeBodyMobile> createState() => _HomeBodyMobileState();
}

class _HomeBodyMobileState extends State<HomeBodyMobile> {
  Color backgroundColor = const Color(
    0xFF1F1A30,
  );
  TextEditingController commandController = TextEditingController();
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.1,
                0.4,
                0.7,
                0.9,
              ],
              colors: [
                purple.withOpacity(0.8),
                purple,
                blue,
                blue,
              ],
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                grey.withOpacity(0.2),
                BlendMode.dstATop,
              ),
              image: const NetworkImage(
                'https://mir-s3-cdn-cf.behance.net/project_modules/fs/01b4bd84253993.5d56acc35e143.jpg',
              ),
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
                            alignment:Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isOpen = false;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isOpen = true;
                        });
                      },
                      child: Icon(
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
                        color: Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(
                        5.0,
                      ),
                      child: TextField(
                        controller: commandController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Escribe aqui.......',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
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
      ],
    );
  }
}
