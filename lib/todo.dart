import 'package:flutter/material.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  icon: Icon(Icons.arrow_back_sharp,
                      color: Colors.black, size: 30)),
            ),
            SizedBox(
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'To Do',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      body: ToDoLsit(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: Icon(
          Icons.add_circle,
          color: Color(0xFF208181),
          size: 60,
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ToDoLsit extends StatefulWidget {
  const ToDoLsit({Key? key}) : super(key: key);

  @override
  _ToDoLsitState createState() => _ToDoLsitState();
}

class _ToDoLsitState extends State<ToDoLsit> {
  Icon circle = Icon(Icons.circle_outlined, size: 40, color: Color(0xFFFFA8A8));

  int done = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 20,
          thickness: 3,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (done == 0) {
                      circle = Icon(Icons.circle_outlined,
                          size: 40, color: Color(0xFFFFA8A8));
                      done = 1;
                    } else {
                      circle = Icon(Icons.check_circle_outline_rounded,
                          size: 40, color: Color(0xFFFFA8A8));
                      done = 0;
                    }
                  });
                },
                splashRadius: 1,
                icon: circle,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                'Assignment1',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            )
          ],
        ),
      ],
    );
  }
}

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
