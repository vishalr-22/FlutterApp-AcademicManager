import 'package:flutter/material.dart';
import 'addclass.dart';

void main() {
  runApp(const ClassPage());
}

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // List<int> lst = [1, 2, 3, 4];
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddClass()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 40,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "My Classes",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
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
    ));
  }
}

// ignore: use_key_in_widget_constructors
class Divide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
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
    return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(left: 0.0, right: 10.0),
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
        width: 210,
        decoration: BoxDecoration(
            // border: Border(left: BorderSide(color: Colors.black, width:3)),
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Subject-1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
                      fontSize: 20,
                    ),
                  ),
                ))
          ],
        ),
      ),
      Container(
        padding: new EdgeInsets.fromLTRB(15, 18, 15, 18),
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(5)),

        child: Text(
          "Day",
          style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
        ),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(left: 10.0, right: 0.0),
          padding: new EdgeInsets.fromLTRB(15, 17, 15, 17),
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          )),
    ]));
  }
}
