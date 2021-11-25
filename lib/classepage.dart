import 'package:flutter/material.dart';
import 'addclass.dart';
import 'widgets/bottombar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const ClassPage());
}

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddClass()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: lw / 10,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.teal,
        padding: EdgeInsets.all(lw / 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(lw / 40, lh / 20, 0, lh / 40),
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: lw / 10,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(lw / 10, lh / 15, 0, lh / 40),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "My Classes",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, lh / 25),
              // ignore: prefer_const_constructors
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Subject(),
            Divide(),
            Subject(),
            Divide(),
            Subject(),
            Divide(),
            Subject(),
          ],
        ),
      ),
      bottomNavigationBar:
          SizedBox(height: lh / 10, child: const BottomNavBar()),
    ));
  }
}

// ignore: use_key_in_widget_constructors
class Divide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;

    return (Container(
      padding: EdgeInsets.fromLTRB(lw / 40, lh / 60, lw / 40, lh / 50),
      child: const Divider(
        color: Colors.white,
        thickness: 2,
      ),
    ));
  }
}

// ignore: use_key_in_widget_constructors
class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;

    return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 0.0, right: lw / 40),
        padding: EdgeInsets.fromLTRB(lw / 40, lh / 100, lw / 40, lh / 100),
        width: lw / 2,
        decoration: BoxDecoration(
            // border: Border(left: BorderSide(color: Colors.black, width:3)),
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Subject-1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: lh / 40,
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Time",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: lh / 40,
                    ),
                  ),
                ))
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(lw / 30, lh / 40, lw / 30, lh / 40),
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(5)),

        child: Text(
          "Day",
          style: TextStyle(
              color: Colors.black.withOpacity(0.5), fontSize: lh / 40),
        ),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(left: 10.0, right: 0.0),
          padding: EdgeInsets.fromLTRB(lw / 30, lh / 50, lw / 30, lh / 50),
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          )),
    ]));
  }
}
