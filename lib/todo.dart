// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, empty_constructor_bodies, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'widgets/bottombar.dart';

class TodoPage extends StatefulWidget {
  // const TodoPage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todos = List.empty();
  String title = "";
  String description = "";
  // bool isComplete = false;

  @override
  void initState() {
    super.initState();
    todos = ["Hello", "Hey There", false];
  }

  createToDo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Task").doc(title);

    Map<String, dynamic> todoList = {
      "todoTitle": title,
      "todoDesc": description,
      // "complete": isComplete,
    };

    documentReference
        .set(todoList)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Task").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  updateTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Task").doc(item);
    documentReference.update(item);
    // .updateData(item)
    // .whenComplete(() => print("Task updated!"))
    // .catchError((e) => print(e));
  }

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
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('Task').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          QueryDocumentSnapshot<Object?>? documentSnapshot =
                              snapshot.data?.docs[index];

                          return Dismissible(
                              key: UniqueKey(),
                              // key: Key(index.toString()),
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
                                  deleteTodo((documentSnapshot != null)
                                      ? (documentSnapshot["todoTitle"])
                                      : "");
                                });
                              },
                              child: ListTile(
                                // leading: Checkbox(
                                //     activeColor: Colors.lightBlueAccent,
                                //     value: documentSnapshot!["complete"],
                                //     onChanged: (value) {
                                //       setState(() {
                                //         value = !value!;
                                //         updateTodo(
                                //             documentSnapshot["complete"]);
                                //       });
                                //     }),
                                title: Text((documentSnapshot != null)
                                    ? (documentSnapshot["todoTitle"])
                                    : ""),
                                subtitle: Text((documentSnapshot != null)
                                    ? ((documentSnapshot["todoDesc"] != null)
                                        ? documentSnapshot["todoDesc"]
                                        : "")
                                    : ""),
                              ));
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue,
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add Todo"),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: 'Title'),
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Description'),
                          onChanged: (String value) {
                            description = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            //todos.add(title);
                            createToDo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
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
