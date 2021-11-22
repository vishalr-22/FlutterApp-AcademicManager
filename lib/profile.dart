import 'package:flutter/material.dart';
import 'editProfile.dart';
import 'widgets/bottombar.dart';
import 'main.dart';

var username = 'R. Vishal';
var sem = 'Sem V';
var course = 'Computer Engineering';
var college = 'K J Somaiya college of engineering';
void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
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
            padding: new EdgeInsets.fromLTRB(60, 30, 30, 10),
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

class ProfileCard extends StatelessWidget {
  
  @override
  Widget build(context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;
    
    return Container(
        alignment: AlignmentDirectional.center,
        height: lh / 3.5,
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
              "$sem",
              style: TextStyle(
                fontSize: lh / 30,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          )
        ]));
  }
}

class ProfileDetails extends StatelessWidget {
  
  @override
  Widget build(context) {
    var lw = MediaQuery.of(context).size.width;
    var lh = MediaQuery.of(context).size.height;

    return Container(
        padding: EdgeInsets.fromLTRB(lw / 43, lw / 30, lw / 200, lw / 30),
        width: double.infinity,
        height: lh / 5.8,
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
                  Text(
                    " $college",
                    style: TextStyle(color: Colors.black, fontSize: lh / 38),
                  )
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
              context, MaterialPageRoute(builder: (context) => EditProfilePage()));
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
