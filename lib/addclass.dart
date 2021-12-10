// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'widgets/bottombar.dart';

void main() {
  runApp(const AddClass());
}

class AddClass extends StatelessWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lh = MediaQuery.of(context).size.height;
    const appTitle = 'Add a class';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
        bottomNavigationBar: SizedBox(height: lh / 10, child: BottomNavBar()),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
  static _MyCustomFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyCustomFormState>();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final formKey = GlobalKey<FormState>();
  final format = DateFormat.Hm();
  final Map<String, dynamic> formData = {
    'subject': null,
    'classLink': null,
    'fromTime': null,
    'toTime': null,
    'days': null
  };

  final firestoreInstance = FirebaseFirestore.instance;

  void SaveToDb() {
    firestoreInstance.collection("classes").add(formData).then((value) {
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type Subject name here',
              ),
              onSaved: (newValue) {
                formData['subject'] = newValue!;
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, ht / 50, 0, ht / 70),
              child: Text(
                "Class Link",
                style:
                    TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), // UnderlineInputBorder(),
                hintText: 'Paste class link here',
              ),
              onSaved: (newValue) {
                formData['classLink'] = newValue!;
              },
            ),
            SizedBox(
              height: ht / 50,
            ),
            Center(
                child: Text(
              "Timing",
              style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
            )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              BasicTimeField(
                onTimeSelect: (classTime) {
                  formData['fromTime'] = classTime.substring(11, 16);
                },
              ),
              SizedBox(
                width: wd / 9,
                child: Center(
                  child: Text(
                    "to",
                    style: TextStyle(
                        fontSize: ht / 40, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              BasicTimeField(
                onTimeSelect: (classTime) {
                  formData['toTime'] = classTime.substring(11, 16);
                },
              )
            ]),
            SizedBox(
              height: ht / 40,
            ),
            Center(
                child: Text(
              "Select days of week",
              style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
            )),
            DayPicker(),
            SizedBox(
              height: ht / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    formKey.currentState?.save();
                    SaveToDb();
                    print(formData);
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

typedef TimeCallback(String classTime);

class BasicTimeField extends StatelessWidget {
  final format = DateFormat.Hm();
  final TimeCallback onTimeSelect;
  BasicTimeField({required this.onTimeSelect});
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 4,
      child: DateTimeField(
        format: format,
        decoration: InputDecoration(border: UnderlineInputBorder()),
        onShowPicker: (context, currentValue) async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          onTimeSelect(DateTimeField.convert(time).toString());
          return time == null ? null : DateTimeField.convert(time);
        },
      ),
    );
  }
}

String intDayToEnglish(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Mon';
  if (day % 7 == DateTime.tuesday % 7) return 'Tue';
  if (day % 7 == DateTime.wednesday % 7) return 'Wed';
  if (day % 7 == DateTime.thursday % 7) return 'Thu';
  if (day % 7 == DateTime.friday % 7) return 'Fri';
  if (day % 7 == DateTime.saturday % 7) return 'Sat';
  if (day % 7 == DateTime.sunday % 7) return 'Sun';
  throw '🐞 This should never have happened: $day';
}

String valuesToEnglishDays(List<bool?> values, bool? searchedValue) {
  final days = <String>[];
  for (int i = 0; i < values.length; i++) {
    final v = values[i];
    // Use v == true, as the value could be null, as well (disabled days).
    if (v == searchedValue) days.add(intDayToEnglish(i));
  }
  if (days.isEmpty) return '';
  return days.join(', ');
}

class DayPicker extends StatefulWidget {
  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  final values2 = List.filled(7, false);
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: ht / 40,
        ),
        Text(
          'Selected Day(s): ${valuesToEnglishDays(values2, true)}',
          style: TextStyle(fontSize: ht / 40, fontStyle: FontStyle.italic),
        ),
        WeekdaySelector(
          onChanged: (v) {
            setState(() {
              values2[v % 7] = !values2[v % 7];
            });
          },
          values: values2,
          selectedFillColor: Colors.amber,
          selectedColor: Colors.black,
          selectedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.red.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ],
    );
  }
}
