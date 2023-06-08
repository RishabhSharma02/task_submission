import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tasks_app/views/Addtask.dart';
import 'package:tasks_app/views/taskdesc.dart';

import 'controllers/Taskcontroller.dart';
import 'models/Task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    final taskcontrollerp = Get.find<Taskcontroller>();
    var length = taskcontrollerp.tasks.length;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: SizedBox(
        height: 50,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            Get.to(() => Addtask(), transition: Transition.downToUp);
            setState(() {
              length = taskcontrollerp.tasks.length;
            });
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Add task",
                  style: GoogleFonts.nunito(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: Text(
              DateTime.now().hour <= 12
                  ? "Good Morning 👋"
                  : DateTime.now().hour > 12
                      ? "Good Afternoon 👋"
                      : DateTime.now().hour > 16?"Good Afternoon 👋":"Good Night !",
              style: GoogleFonts.nunito(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: Text(
              "Complete your tasks to win today ",
              style: GoogleFonts.nunito(fontSize: 25, color: Colors.white),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 10, right: 10, bottom: 5),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 239, 239, 239),
                  prefixIcon: PhosphorIcon(
                    PhosphorIcons.regular.magnifyingGlass,
                    color: Colors.white,
                  ),
                  hintText: "Search for tasks",
                  hintStyle: GoogleFonts.nunito(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.white,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.pink,
                      ))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  "Your tasks",
                  style: GoogleFonts.nunito(fontSize: 20, color: Colors.white),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5, right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: GoogleFonts.nunito(fontSize: 14, color: Colors.pink),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: GetBuilder(builder: (Taskcontroller taskcontroller) {
            return ListView.builder(
              itemCount: taskcontroller.tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2, color: Color.fromARGB(255, 93, 92, 92)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => Taskdescription(
                                        name: taskcontroller
                                              .tasks[index].name,
                                          desc: taskcontroller
                                              .tasks[index].description,
                                          prio:
                                              taskcontroller.tasks[index].priority,
                                          id: taskcontroller.tasks[index].id),
                                      transition: Transition.leftToRightWithFade);
                                },
                                child: PhosphorIcon(
                                  PhosphorIcons.regular.caretRight,
                                  color: Colors.white,
                                )),
                            onTap: () {
                              taskcontroller
                                  .deleteTask(taskcontroller.tasks[index].id);
                              setState(() {
                                length = taskcontrollerp.tasks.length;
                              });
                            },
                          ),
                        ],
                      ),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: Colors.black,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: taskcontroller.tasks[index].isCompleted,
                            onChanged: (value) {
                              taskcontroller
                                  .changestate(taskcontroller.tasks[index]);

                              setState(() {
                                taskcontroller
                                    .deleteTask(taskcontroller.tasks[index].id);
                                Get.showSnackbar(GetSnackBar(
                                  message: "Deleted task",
                                  duration: Duration(seconds: 2),
                                ));

                                length = taskcontrollerp.tasks.length;
                              });
                            },
                          ),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskcontroller.tasks[index].name.length > 15
                                ? taskcontroller.tasks[index].name
                                    .substring(0, 15)
                                : taskcontroller.tasks[index].name,
                            maxLines: 3,
                            style: GoogleFonts.nunito(
                                color: Colors.white, fontSize: 22),
                          ),
                          Text(
                            taskcontroller.tasks[index].description.length > 20
                                ? taskcontroller.tasks[index].description
                                    .substring(0, 20)+"....."
                                : taskcontroller.tasks[index].description,
                            maxLines: 3,
                            style: GoogleFonts.nunito(
                                color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        taskcontroller.tasks[index].priority,
                        style: GoogleFonts.nunito(
                            color: taskcontroller.tasks[index].priority ==
                                    "High"
                                ? Color.fromARGB(255, 255, 0, 0)
                                : taskcontroller.tasks[index].priority == "Med"
                                    ? Colors.amber
                                    : Colors.green),
                      ),
                    ));
              },
            );
          }))
        ]),
      ),
    );
  }
}
