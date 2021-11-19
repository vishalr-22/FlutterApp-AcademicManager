// ignore_for_file: prefer_const_constructors

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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type Subject name here',
              ),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(), // UnderlineInputBorder(),
                hintText: 'Name of assignment',
              ),
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
                  BasicDateField(),
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
                  BasicTimeField()
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
                    formKey.currentState?.save();
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

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MMM-yyyy");
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 2.5,
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 2.5,
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onShowPicker: (context, currentValue) async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return time == null ? null : DateTimeField.convert(time);
        },
      ),
    );
  }
}
