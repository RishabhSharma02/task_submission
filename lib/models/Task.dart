import 'package:uuid/uuid.dart';

class Task {
  String id;
  String description;
  String priority;
  bool isCompleted;
  Task({required this.priority,required this.description})
      : this.id = Uuid().v1(),
        this.isCompleted = false;
}