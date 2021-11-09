// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'classepage.dart';
import 'assignment.dart';
import 'folder.dart';
import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(title: 'AcadM'),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(40, 40, 225, 20),
        color: Colors.white,
        width: double.infinity,
        height: 100.0,
        child: Image.asset('assets/images/applogo.png'));
  }
}

class HelloTag extends StatelessWidget {
  const HelloTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _username = 'Piyush';
    const _semester = 5;
    return Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
        color: Colors.indigo[800],
        width: double.infinity,
        height: 100.0,
        child: Column(
          children: const [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello $_username !',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sem $_semester',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ));
  }
}

class DateTag extends StatelessWidget {
  const DateTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    var _datestr = date.toString().substring(0, 10);
    return Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.fromLTRB(40, 30, 0, 0),
        child: Text(
          _datestr,
          style: TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
        ));
  }
}

class MyClasses extends StatelessWidget {
  const MyClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
      child: InkWell(
        hoverColor: Colors.yellowAccent,
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ClassPage()));
        },
        child: const SizedBox(
          width: double.infinity,
          height: 140,
          child: Padding(
            padding: EdgeInsets.only(left: 14.0, top: 20.0),
            child: Text(
              'My Classes',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class AssignmentFolder extends StatelessWidget {
  const AssignmentFolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.white60,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: InkWell(
                hoverColor: Colors.yellowAccent,
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentPage()));
                },
                child: const SizedBox(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Assignments',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: Colors.white60,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: InkWell(
                hoverColor: Colors.yellowAccent,
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FolderPage()));
                },
                child: const SizedBox(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Folders',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoBar extends StatelessWidget {
  const ToDoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 180, 20),
              child: Text(
                'To-Do',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TodoPage()));
                })
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.date_range,
            size: 30,
          ),
          label: 'Calender',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            size: 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.grey[900],
      unselectedItemColor: Colors.grey[800],
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(children: [
        AppName(),
        HelloTag(),
        DateTag(),
        MyClasses(),
        AssignmentFolder(),
        Divider(
          height: 30,
          thickness: 2,
          color: Colors.black45,
          indent: 40,
          endIndent: 40,
        ),
        ToDoBar(),
      ]),
      bottomNavigationBar: SizedBox(height: 80, child: BottomNavBar()),
    );
  }
}
