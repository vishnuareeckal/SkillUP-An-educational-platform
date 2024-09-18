import 'package:flutter/material.dart';
import 'package:login_page/widgets/courses/python_class_1.dart';

// import 'package:to_do/widgets/chapter1.dart';
// import 'package:to_do/widgets/chapter2.dart';
import 'package:google_fonts/google_fonts.dart';

class Module extends StatefulWidget {
  const Module({super.key});

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  TextEditingController controller = new TextEditingController();

  List<String> ModuleList = [
    "Chapter 1",
    "Chapter 2",
    "Chapter 3",
    "Chapter 4",
    "Chapter 5",
  ];

  bool displayModuleList = false;
  int? val;
  bool isbuttonPressed = false;
  // final String child;

  // Module ({required this.child});

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
                      Text(
                        "Module 1",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
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
                height: 200,
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
                child: ListView.builder(
                  itemCount: ModuleList.length,
                  itemBuilder: ((contect, index) {
                    //gesture detector

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.text = ModuleList[index].toString();
                          val = index + 1;
                          if (val == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => Chapter1()));
                          } else if (val == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => Chapter1()));
                          } else {
                            null;
                          }
                        });
                      },
                      child: ListTile(
                        title: Text(ModuleList[index]),
                      ),
                    );
                  }),
                ),
              ),
            )
          : SizedBox()
    ]);
  }
}
