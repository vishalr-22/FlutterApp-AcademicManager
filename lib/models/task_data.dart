// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class Task {
  final String name;
  bool isDone;
  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

// ignore: non_constant_identifier_names
class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'TASK 1'),
  ];

  int get getCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
