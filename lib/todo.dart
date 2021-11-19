// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, empty_constructor_bodies, avoid_print

import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'widgets/task_list.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 20,
              icon: Icon(Icons.keyboard_arrow_left_outlined,
                  color: Colors.black, size: 40)),
        ),
        title: Text(
          'To Do',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            height: 20,
            thickness: 3,
            indent: 20,
            endIndent: 20,
            color: Colors.lightBlueAccent,
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen())));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lh = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range,
              size: lh / 25,
            ),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: lh / 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: lh / 25,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.grey[900],
        unselectedItemColor: Colors.grey[800],
      ),
    );
  }
}
