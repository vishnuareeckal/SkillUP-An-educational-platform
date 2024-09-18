// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ModulePage extends StatefulWidget {
  dynamic txt;
  Widget? destination1;
  Widget? destination2;
  Widget? destination3;
  Widget? destination4;
  Widget? destination5;
  ModulePage({
    Key? myKey,
    required this.txt,
    this.destination1,
    this.destination2,
    this.destination3,
    this.destination4,
    this.destination5,
  }) : super(key: myKey);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  TextEditingController controller = TextEditingController();

  List<String> moduleList = [
    "Chapter 1",
    "Chapter 2",
    "Chapter 3",
    "Chapter 4",
    "Chapter 5",
  ];

  bool displayModuleList = false;
  int? val;
  bool isbuttonPressed = false;

  void buttonpressed() {
    setState(() {
      displayModuleList = !displayModuleList;
      if (isbuttonPressed == false) {
        isbuttonPressed = true;
      } else if (isbuttonPressed == true) {
        isbuttonPressed = false;
      }
    });
  }

  late Widget? data;

  @override
  void initState() {
    super.initState();
    // Initialize the state variable using the widget's initialData
    data = _createWidget();
  }

  Widget? _createWidget() {
    if (val == 1) {
      return widget.destination1;
    } else if (val == 2) {
      return widget.destination2;
    } else if (val == 3) {
      return widget.destination3;
    } else if (val == 4) {
      return widget.destination4;
    } else if (val == 5) {
      return widget.destination5;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 4, bottom: 4),
        child: Container(
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                buttonpressed();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffDDDDDD),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        // spreadRadius: 1,
                        offset: Offset(0, 0))
                  ],
                ),
                width: double.infinity,
                height: 62,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "${widget.txt}",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        // color: Colors.amber,
                        child: isbuttonPressed
                            ? Icon(Icons.expand_less)
                            : Icon(Icons.expand_more),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      displayModuleList
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xfff3f3f3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: moduleList.length,
                        itemBuilder: ((contect, index) {
                          //gesture detector

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.text = moduleList[index].toString();
                                val = index + 1;
                                data = _createWidget();
                                if (val == 1 ||
                                    val == 2 ||
                                    val == 3 ||
                                    val == 4 ||
                                    val == 5) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => data!,
                                    ),
                                  );
                                }
                              });
                            },
                            child: ListTile(
                              title: Text(
                                moduleList[index],
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox()
    ]);
  }
}
