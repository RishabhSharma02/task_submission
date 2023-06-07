import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/Task.dart';

class Taskcontroller extends GetxController{
  List<Task> _tasks=[];
  List<Task> get tasks => _tasks;
  addTask(Task task){
    _tasks.add(task);
    update();
  }
  deleteTask(String id){
    _tasks.removeWhere((element)=>element.id==id);
    update();
  }
  changestate(Task task){
    int index=_tasks.indexOf(task);
    tasks[index].isCompleted=!tasks[index].isCompleted;
    update();
  }
}