import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tasks_app/models/Task.dart';

import '../controllers/Taskcontroller.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>['High', 'Med', 'Low'];
    String selected;
    String dropdownValue = list.first;

    TextEditingController _desccontroller = new TextEditingController();
    TextEditingController _priorcontroller = new TextEditingController();
    final taskcontrollerp = Get.find<Taskcontroller>();
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: Text(
              "Task description",
              style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _desccontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.white,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 3, color: Colors.pink))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              "Task priority",
              style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: PhosphorIcon(PhosphorIcons.regular.caretDown),
              elevation: 16,
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              underline: Container(
                height: 2,
                color: Colors.pink,
              ),
              dropdownColor: Colors.black,
              onChanged: (value) {
                dropdownValue = value.toString();
                Get.showSnackbar(GetSnackBar(
                  message: "Selected value as $dropdownValue",
                  duration: Duration(seconds: 2),
                ));
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  taskcontrollerp.addTask(Task(
                      priority: dropdownValue,
                      description: _desccontroller.text));
                  Navigator.pop(context);
                },
                child: Text(
                  'Add task',
                  style: GoogleFonts.nunito(color: Colors.white),
                ),
                color: Colors.pink,
              ),
            ),
          )
        ]),
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Task",
            style: GoogleFonts.nunito(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: PhosphorIcon(
                PhosphorIcons.bold.caretLeft,
                color: Colors.white,
              )),
        ));
  }
}
