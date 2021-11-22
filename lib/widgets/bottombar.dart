import 'package:flutter/material.dart';
import '../main.dart';
import '../profile.dart';

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
          onTap: (int index) {
            if (index == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            } else if (index == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            }
          }),
    );
  }
}
