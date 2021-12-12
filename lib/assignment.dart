// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'addassignment.dart';
import 'widgets/bottombar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(AssignmentPage());
}

class AssignmentPage extends StatelessWidget {
  // This widget is the root of your application.

  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddAssignment()));
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
        padding: new EdgeInsets.all(wd / 25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(wd / 40, lh / 20, 0, lh / 40),
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
                  padding: EdgeInsets.fromLTRB(wd / 9, lh / 20, 0, lh / 60),
                  child: Text(
                    "Assignments",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, lh / 20),
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future:
                    FirebaseFirestore.instance.collection('Assignments').get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Subject(
                                dataMap: snapshot.data!.docs[index].data()
                                    as Map<dynamic, dynamic>),
                            Divide()
                          ],
                        );
                      },
                    );
                  } else {
                    // or your loading widget here
                    return Text("Loading....");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
    ));
  }
}

class Divide extends StatelessWidget {
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return (Container(
      padding: EdgeInsets.fromLTRB(wd / 25, lh / 50, wd / 25, lh / 50),
      child: Divider(
        color: Colors.white,
        thickness: 2,
      ),
    ));
  }
}

class Subject extends StatelessWidget {
  Map dataMap;

  Subject({Key? key, required this.dataMap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    var subjectName = dataMap["title"];
    var dueDate = dataMap["dueDate"];
    var dueTime = dataMap["dueTime"];

    return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(left: 0.0, right: 10.0),
        padding: EdgeInsets.fromLTRB(0, lh / 90, 0, lh / 90),
        width: 270,
        decoration: BoxDecoration(
            // border: Border(left: BorderSide(color: Colors.black, width:3)),
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$subjectName",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
                padding: new EdgeInsets.fromLTRB(10, 7, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Due: $dueDate ($dueTime)",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 17,
                    ),
                  ),
                ))
          ],
        ),
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(left: 10.0, right: 0.0),
          padding: EdgeInsets.fromLTRB(wd / 21, wd / 21, wd / 21, wd / 21),
          child: Icon(
            Icons.edit,
            color: Colors.white,
          )),
    ]));
  }
}
