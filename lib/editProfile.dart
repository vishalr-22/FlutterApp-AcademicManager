import 'package:flutter/material.dart';
import 'profile.dart' as Profile;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestoreInstance = FirebaseFirestore.instance;

void main() {
  runApp(Edit());
}

void editData() {
    firestoreInstance.collection("Profile").doc('QHZKsD7tgk0dp8XJJNDD').
    update({"username":Profile.username , "sem":Profile.sem, "course":Profile.course, "college":Profile.college});
    // print(username);
    // print(result);
    // return this.y ;
  }


class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EditProfilePage());
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(context) {
    var lh = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Colors.grey[850],
          padding: new EdgeInsets.all(25),
          child: Column(children: [
            EditHeader(),
            EditName(),
            EditSem(),
            EditBranch(),
            EditCollege()
          ])),
    );
  }
}

class EditHeader extends StatelessWidget {
  @override
  Widget build(context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    
    return Container(
      child: Row(
        children: [
          // Container(
          //     padding: EdgeInsets.fromLTRB(wd / 70, ht / 20, wd / 30, ht / 50),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Profile.ProfilePage()));
          //       },
          //       child: Container(
          //         child: Icon(
          //           Icons.close,
          //           color: Colors.white,
          //           size: 40,
          //         ),
          //       ),
          //     )),
          Container(
            padding: EdgeInsets.fromLTRB(wd / 40, ht / 20, wd / 4, ht / 50),
              
            alignment: AlignmentDirectional.center,
            child: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(wd / 7, ht / 20, 0, ht / 50),
              
              child: GestureDetector(
                onTap: () {
                  editData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile.ProfilePage()));
                },
                child: Container(
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )),
          
        ],
      ),
    );
  }
}

class EditName extends StatelessWidget {
  
  @override
  Widget build(context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, ht / 50, 0, ht / 65),
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Container(
              height: 50,
              // color: Colors.grey[400],
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                autocorrect: true,
                autofocus: true,
                onChanged: (text){
                  Profile.username = text;
                },
                initialValue: Profile.username,
              )),
        ],
      ),
    );
  }
}

class EditSem extends StatelessWidget {
  @override
  Widget build(context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    
    return Container(
      // color: Colors.black,
      width: double.infinity,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, ht / 35, 0, ht / 65),
              
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Sem",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Container(
              height: 50,
              // color: Colors.grey[400],
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                autocorrect: true,
                autofocus: true,
                onChanged: (text){
                  Profile.sem = text;
                },
                initialValue: Profile.sem,
              )),
        ],
      ),
    );
  }
}

class EditBranch extends StatelessWidget {
  @override
  Widget build(context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    
    return Container(
      // color: Colors.black,
      width: double.infinity,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, ht / 35, 0, ht / 65),
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Branch",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Container(
              height: 50,
              // color: Colors.grey[400],
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                autocorrect: true,
                autofocus: true,
                onChanged: (text){
                  Profile.course = text;
                },
                initialValue: Profile.course,
              )),
        ],
      ),
    );
  }
}

class EditCollege extends StatelessWidget {
  @override
  Widget build(context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, ht / 35, 0, ht / 65),
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "College",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Container(
              height: 50,
              // color: Colors.grey[400],
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                autocorrect: true,
                autofocus: true,
                onChanged: (text){
                  Profile.college = text;
                },
                initialValue: Profile.college,
              )),
        ],
      ),
    );
  }
}