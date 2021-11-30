// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'classepage.dart';
import 'assignment.dart';
import 'folder.dart';
import 'todo.dart';
import 'package:provider/provider.dart';
import 'package:acadmt/models/task_data.dart';
import 'widgets/bottombar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskData())],
      child: MaterialApp(
        home: const HomePage(title: 'AcadM'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    var lh = MediaQuery.of(context).size.height;
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
      bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(lw / 10, lh / 20, 0, lh / 40),
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
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.fromLTRB(lw / 10, lw / 20, lw / 20, lw / 20),
        color: Colors.indigo[800],
        width: double.infinity,
        height: lh / 8,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello $_username !',
                style: TextStyle(fontSize: lh / 30, color: Colors.white),
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
                    fontSize: lh / 50,
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
    var _datestr = DateFormat.yMMMd().format(DateTime.now());
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.fromLTRB(lw / 10, lh / 25, 0, 0),
        child: Text(
          _datestr,
          style: TextStyle(
              fontSize: lh / 50,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ));
  }
}

class MyClasses extends StatelessWidget {
  const MyClasses({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white60,
      margin: EdgeInsets.fromLTRB(lw / 10, lh / 40, lw / 10, lh / 80),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ClassPage()));
        },
        child: SizedBox(
          width: double.infinity,
          height: lh / 6,
          child: Padding(
            padding: EdgeInsets.only(left: 14.0, top: 20.0),
            child: Text(
              'My Classes',
              style: TextStyle(
                  fontSize: lh / 40,
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
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(lw / 10, lh / 80, lw / 10, lh / 80),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.white60,
              margin: EdgeInsets.fromLTRB(0, 0, lw / 40, 0),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentPage()));
                },
                child: SizedBox(
                  height: lh / 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Assignments',
                        style: TextStyle(
                            fontSize: lh / 50,
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
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FolderPage()));
                },
                child: SizedBox(
                  height: lh / 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Folders',
                        style: TextStyle(
                            fontSize: lh / 50,
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
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white60,
      margin: EdgeInsets.fromLTRB(lw / 10, lh / 40, lw / 10, lh / 80),
      child: SizedBox(
        width: double.infinity,
        height: lh / 11,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(lw / 20, lh / 40, lw / 2.3, lh / 40),
              child: Text(
                'To-Do',
                style: TextStyle(
                    fontSize: lh / 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: lh / 15,
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
