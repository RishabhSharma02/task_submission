import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tasks_app/models/Task.dart';

import '../controllers/Taskcontroller.dart';
class Taskdescription extends StatelessWidget {
  String name;
  String desc;
  String prio;
  String id;
  Taskdescription({super.key,required this.name,required this.id,required this.desc,required this.prio});

  @override
  Widget build(BuildContext context) {
    TextEditingController new_name=new TextEditingController();
    TextEditingController new_desc=new TextEditingController();
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
          child: Container(
            height: MediaQuery.of(context).size.height/7,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      name,
                      style: GoogleFonts.nunito(
                          fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                     Text(
                      desc,
                      style: GoogleFonts.nunito(
                          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),
          ),
        ),Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/3),
              child: Center(
                
                child: MaterialButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 height: 50,
                 
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
            ),
            Padding(
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/3),
          child: Center(
            
            child: MaterialButton(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             height: 50,
             
                    onPressed: () {
                     
                      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text('Update Task',style: GoogleFonts.nunito(fontSize: 25,color: Colors.white),),
          content: Container(
            width: MediaQuery.of(context).size.width*0.75,
            height: MediaQuery.of(context).size.width*0.6,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                "Task name",
                style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: new_name,
                decoration: InputDecoration(
                   hintText: "Add new name",
                    hintStyle: GoogleFonts.nunito(color: Colors.white),
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
              
            ),Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                "New task description",
                style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: new_desc,
                decoration: InputDecoration(
                   hintText: "Add new description",
                    hintStyle: GoogleFonts.nunito(color: Colors.white),
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
              
            ),]),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel',style: GoogleFonts.nunito(color: Colors.pink,),
            )),
            TextButton(
              onPressed: () {
                name=new_name.text;
                desc=new_desc.text;
                taskcontrollerp.updatetask(id, new_desc.text, new_name.text);
                Navigator.pop(context);
                Get.showSnackbar(GetSnackBar(message: "Task updated !",duration: Duration(seconds: 2),));

              },
              child:Text('Update',style: GoogleFonts.nunito(color: Colors.pink),),
            ),
          ],
        ),
      );
                    },
                    child: Text(
                      'Update task',
                      style: GoogleFonts.nunito(color: Colors.white),
                    ),
                    color: Colors.pink,
                  ),
          ),
        )
          ],
        ),],));
  }
}
