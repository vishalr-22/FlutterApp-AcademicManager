// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, must_be_immutable

import 'package:acadmt/folder_help/folder_list.dart';
import 'package:acadmt/folder_help/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(FolderPage());
}

class FolderPage extends StatelessWidget {
  List<Folder> folders = Utils.getMockedFolders();

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
          title: Text('Folder'),
          centerTitle: true,
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
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: folders.length,
              itemBuilder: (BuildContext context, int index) {
                return FolderCard(
                  folder: folders[index],
                  onCardClick: () {},
                );
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFFFFDC1),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: SizedBox(child: BottomNavBar()),
      ),
    );
  }
}

class FolderCard extends StatelessWidget {
  Folder folder;
  Function onCardClick;
  FolderCard({required this.folder, required this.onCardClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick;
      },
      child: Container(
          margin: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF1D1E33),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Icon(
                  Icons.folder,
                  color: Colors.blue[900],
                  size: 80,
                ),
              ),
              Center(
                child: Text(
                  this.folder.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )),
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
