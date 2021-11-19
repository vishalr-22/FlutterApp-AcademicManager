// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:acadmt/models/task_data.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TaskData>(context).tasks.isEmpty
        ? Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : Consumer<TaskData>(
            builder: (context, taskData, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final task = taskData.tasks[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'DELETE',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        taskData.deleteTask(task);
                      });
                    },
                    child: TaskTile(
                      taskTitle: task.name,
                      isChecked: task.isDone,
                      checkboxCallback: (checkboxState) {
                        taskData.updateTask(taskData.tasks[index]);
                      },
                      longpressCallback: () {
                        taskData.deleteTask(task);
                      },
                    ),
                  );
                },
                itemCount: taskData.getCount,
              );
            },
          );
  }
}
