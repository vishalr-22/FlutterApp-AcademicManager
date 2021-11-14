// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'add_task_screen.dart';

void main() {
  runApp(const TodoPage());
}

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
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
            color: Colors.blueAccent,
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
              context: context, builder: (context) => AddTaskScreen());
        },
        backgroundColor: Color(0xFF208181),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (bool? value) {},
      ),
      title: Text(
        'Assignment',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}

// class ToDoLsit extends StatefulWidget {
//   const ToDoLsit({Key? key}) : super(key: key);

//   @override
//   _ToDoLsitState createState() => _ToDoLsitState();
// }

// class _ToDoLsitState extends State<ToDoLsit> {
//   Icon circle = Icon(Icons.circle_outlined, size: 40, color: Color(0xFFFFA8A8));

//   int done = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Divider(
//           height: 20,
//           thickness: 3,
//           indent: 20,
//           endIndent: 20,
//           color: Colors.grey,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: ListView(
//             // padding: EdgeInsets.symmetric(horizontal: 20),
//             children: [
//               ListTile(
//                 leading: Checkbox(value: false, onChanged: (bool? value) {}),
//                 title: Text(
//                   'Assignment1',
//                   style: TextStyle(fontSize: 22, color: Colors.black),
//                 ),
//               )
//             ],
//           ),
//         )

//         // Row(
//         //   children: [
//         //     Expanded(
//         //       flex: 1,
//         //       child: IconButton(
//         //         onPressed: () {
//         //           setState(() {
//         //             if (done == 0) {
//         //               circle = Icon(Icons.circle_outlined,
//         //                   size: 40, color: Color(0xFFFFA8A8));
//         //               done = 1;
//         //             } else {
//         //               circle = Icon(Icons.check_circle_outline_rounded,
//         //                   size: 40, color: Color(0xFFFFA8A8));
//         //               done = 0;
//         //             }
//         //           });
//         //         },
//         //         splashRadius: 1,
//         //         icon: circle,
//         //       ),
//         //     ),
//         //     Expanded(
//         //       flex: 5,
//         //       child: Text(
//         //         'Assignment1',
//         //         style: TextStyle(fontSize: 22, color: Colors.black),
//         //       ),
//         //     )
//         //   ],
//         // ),
//       ],
//     );
//   }
// }

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
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
