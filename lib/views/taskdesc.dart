import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../controllers/Taskcontroller.dart';
class Taskdescription extends StatelessWidget {
  String desc;
  String prio;
  String id;
  Taskdescription({super.key,required this.id,required this.desc,required this.prio});

  @override
  Widget build(BuildContext context) {
    final taskcontrollerp = Get.find<Taskcontroller>();
    return Scaffold(backgroundColor: Colors.black,appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Task description",
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
        ),body: Column(children: [Center(
          child: Text(
              desc,
              style: GoogleFonts.nunito(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
            ),
        ),Center(
          child: Text(
                prio,
                style: GoogleFonts.nunito(
                    fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
              ),
        ),Padding(
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/3),
          child: Center(
            
            child: MaterialButton(
                    onPressed: () {
                      taskcontrollerp.deleteTask(id);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete task',
                      style: GoogleFonts.nunito(color: Colors.white),
                    ),
                    color: Colors.pink,
                  ),
          ),
        ),],));
  }
}