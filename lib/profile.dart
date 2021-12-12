// import 'dart:js_util';
import 'package:flutter/material.dart';
import 'editProfile.dart';
import 'widgets/bottombar.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var username = '';
var sem = '';
var course = '';
var college = '';

final firestoreInstance = FirebaseFirestore.instance;

List details = [];
void main() {
  runApp(MainProfile());
}

void fetchData() {
  firestoreInstance
      .collection("Profile")
      .doc('QHZKsD7tgk0dp8XJJNDD')
      .get()
      .then((value) {
    var x = value.data();
    username = x!['username'];
    sem = x['sem'];
    course = x['course'];
    college = x['college'];

    print(value.data());
  });
}

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _Profile();
}

class _Profile extends State<MainProfile> {
  _Profile() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(context) {
    var lh = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.indigo[800],
        padding: new EdgeInsets.all(wd / 15),
        child: Column(
          children: [
            ProfileHeader(),
            ProfileCard(),
            ProfileDetails(),
            ProfileEdit(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          Container(
            padding: new EdgeInsets.fromLTRB(15, 30, 25, 10),
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(lw / 9, lh / 20, 30, 10),
            alignment: AlignmentDirectional.center,
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    var ch = lh / 3.5;
    return Container(
        alignment: AlignmentDirectional.center,
        height: ch,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.fromLTRB(lw / 10, lw / 23, lw / 10, lw / 23),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.amber[900]),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 48,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: new Text(
              "$username",
              style: TextStyle(fontSize: lh / 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            child: new Text(
              "Sem $sem",
              style: TextStyle(
                fontSize: lh / 30,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          )
        ]));
  }
}

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    var ch = lh / 5.4;

    return Container(
        padding: EdgeInsets.fromLTRB(lw / 43, lw / 30, lw / 200, lw / 30),
        width: double.infinity,
        height: ch,
        margin: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
        decoration: BoxDecoration(
            color: Colors.amber[50], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      " $course",
                      style: TextStyle(color: Colors.black, fontSize: lh / 38),
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: Colors.black,
                  ),
                  // Text(
                  //   " $college",
                  //   style: TextStyle(color: Colors.black, fontSize: lh / 38),
                  // )
                  Flexible(
                      child: Text(
                    " $college",
                    style: TextStyle(color: Colors.black, fontSize: lh / 38),
                    maxLines: 2,
                    softWrap: true,
                  ))
                ],
              ),
            )
          ],
        ));
  }
}

class ProfileEdit extends StatelessWidget {
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Edit()));
      },
      child: Container(
          padding: new EdgeInsets.fromLTRB(15, 18, 15, 18),
          width: 155,
          margin: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
          decoration: BoxDecoration(
              color: Colors.amber[50], borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                "Edit Profile ",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Icon(
                Icons.edit,
                color: Colors.black,
              )
            ],
          )),
    );
  }
}
