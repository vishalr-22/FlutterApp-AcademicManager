import 'package:flutter/material.dart';
import 'profile.dart' as Profile;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestoreInstance = FirebaseFirestore.instance;

void main() {
  runApp(Edit());
}

void editData() {
  firestoreInstance.collection("Profile").doc('QHZKsD7tgk0dp8XJJNDD').update({
    "username": Profile.username,
    "sem": Profile.sem,
    "course": Profile.course,
    "college": Profile.college
  });
  // print(username);
  // print(result);
  // return this.y ;
}

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  EditProfilePage createState() {
    return EditProfilePage();
  }
}
final _formKey = GlobalKey<FormState>();

class EditProfilePage extends State<MyCustomForm> {
  @override
  Widget build(context) {
    
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
              color: Colors.grey[850],
              padding: new EdgeInsets.all(25),
              child: Column(children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.fromLTRB(wd / 40, ht / 80, wd / 5, 0),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(wd / 40, ht/80, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Data Saved')),
                              );
                              editData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Profile.ProfilePage()));
                            }
                            
                          },
                          child: const Text('Save Changes'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, ht / 50, 0, ht / 72),
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            "Name",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Container(
                          height: 50,
                          // color: Colors.grey[400],
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              
                              // return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            autocorrect: true,
                            autofocus: true,
                            onChanged: (text) {
                              Profile.username = text;
                            },
                            initialValue: Profile.username,
                          )),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.black,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, ht / 40, 0, ht / 72),
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            "Sem",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Container(
                          height: 50,
                          // color: Colors.grey[400],
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              // return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            autocorrect: true,
                            autofocus: true,
                            onChanged: (text) {
                              Profile.sem = text;
                            },
                            initialValue: Profile.sem,
                          )),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.black,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, ht / 40, 0, ht / 72),
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            "Branch",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Container(
                          height: 50,
                          // color: Colors.grey[400],
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              // return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            autocorrect: true,
                            autofocus: true,
                            onChanged: (text) {
                              Profile.course = text;
                            },
                            initialValue: Profile.course,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, ht / 40, 0, ht / 72),
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            "College",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Container(
                          height: 50,
                          // color: Colors.grey[400],
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              // return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            autocorrect: true,
                            autofocus: true,
                            onChanged: (text) {
                              Profile.college = text;
                            },
                            initialValue: Profile.college,
                          )),
                    ],
                  ),
                )
              ])),
        ));
  }
}
