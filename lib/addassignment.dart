// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_generic_function_type_aliases, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'widgets/bottombar.dart';

void main() {
  runApp(const AddAssignment());
}

class AddAssignment extends StatelessWidget {
  const AddAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lh = MediaQuery.of(context).size.height;
    const appTitle = 'Add a Assignment';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm2(),
        bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
      ),
    );
  }
}

class MyCustomForm2 extends StatefulWidget {
  const MyCustomForm2({Key? key}) : super(key: key);

  @override
  State<MyCustomForm2> createState() => _MyCustomForm2State();
}

class _MyCustomForm2State extends State<MyCustomForm2> {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'subjectName': null,
    'title': null,
    'dueDate': null,
    'dueTime': null
  };

  final firestoreInstance = FirebaseFirestore.instance;

  void SaveToDb() {
    firestoreInstance.collection("Assignments").add(formData).then((value) {
      print('Saved To Database :)');
    });
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(wd / 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, ht / 70),
              child: Text(
                "Subject",
                style:
                    TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Subject name';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type Subject name here',
              ),
              onSaved: (newValue) {
                formData['subjectName'] = newValue;
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, ht / 50, 0, ht / 70),
              child: Text(
                "Title",
                style:
                    TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please provide assignment name';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(), // UnderlineInputBorder(),
                hintText: 'Name of assignment',
              ),
              onSaved: (newValue) {
                formData['title'] = newValue;
              },
            ),
            SizedBox(
              height: ht / 20,
            ),
            Center(
                child: Text(
              "Deadline",
              style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: ht / 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Text(
                    'Due Date',
                    style: TextStyle(
                        fontSize: ht / 50,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                  BasicDateField(
                    onDateSelect: (date) {
                      formData['dueDate'] = date;
                    },
                  ),
                ],
              ),
              SizedBox(width: wd / 30),
              Column(
                children: [
                  Text(
                    'Time',
                    style: TextStyle(
                        fontSize: ht / 50,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                  BasicTimeField(
                    onTimeSelect: (dueTime) {
                      formData['dueTime'] = dueTime.substring(11, 16);
                    },
                  )
                ],
              )
            ]),
            SizedBox(
              height: ht / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Assignment added successfully')),
                      );
                      formKey.currentState?.save();
                      formKey.currentState?.reset();
                      SaveToDb();
                      print('$formData');
                    }
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  child: Text('Reset'),
                  onPressed: () {
                    formKey.currentState?.reset();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

typedef void DateCallback(String date);

class BasicDateField extends StatelessWidget {
  final format = DateFormat.yMMMd();
  final DateCallback onDateSelect;
  var _selectedDate;
  BasicDateField({required this.onDateSelect});
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 2.2,
      child: DateTimeField(
        validator: (value) {
          if (value == null) {
            return 'Please provide a due date!';
          }
          return null;
        },
        format: format,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onShowPicker: (context, currentValue) async {
          _selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          onDateSelect(format.format(_selectedDate).toString());
          return _selectedDate;
        },
      ),
    );
  }
}

typedef TimeCallback(String dueTime);

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");
  final TimeCallback onTimeSelect;
  BasicTimeField({required this.onTimeSelect});
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 2.8,
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onShowPicker: (context, currentValue) async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          if (time == null) {
            onTimeSelect(DateTimeField.convert(TimeOfDay(hour: 23, minute: 59))
                .toString());
          } else {
            onTimeSelect(DateTimeField.convert(time).toString());
          }
          return time == null ? null : DateTimeField.convert(time);
        },
      ),
    );
  }
}
