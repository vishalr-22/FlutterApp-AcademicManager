import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const FolderPage());
}

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF2F5888), Color(0xFF172A41)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Folder'),
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {},
                      child: ReusableCard(colour: Color(0xFF1D1E33)),
                    )),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ReusableCard(colour: Color(0xFF1D1E33)),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ReusableCard(colour: Color(0xFF1D1E33))),
                    Expanded(
                      flex: 2,
                      child: ReusableCard(colour: Color(0xFF1D1E33)),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ReusableCard(colour: Color(0xFF1D1E33))),
                    Expanded(
                      flex: 2,
                      child: ReusableCard(colour: Color(0xFF1D1E33)),
                    ),
                  ],
                )),
            Row(
              children: [
                SizedBox(
                  width: 300,
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color(0xFFFFFDC1),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BottomNavBar(),
            ))
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild});
  final Color colour;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
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
