import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:weekday_selector/weekday_selector.dart';

void main() {
  runApp(const AddClass());
}

class AddClass extends StatelessWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add a class';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: ht / 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: wd / 40, vertical: 1),
            child: Text(
              "Subject",
              style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: wd / 40, vertical: ht / 60),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), // UnderlineInputBorder(),
                hintText: 'Type Subject name here',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: wd / 40, vertical: 1),
            child: Text(
              "Class Link",
              style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: wd / 40, vertical: ht / 60),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), // UnderlineInputBorder(),
                hintText: 'Paste class link here',
              ),
            ),
          ),
          Center(
              child: Text(
            "Timing",
            style: TextStyle(fontSize: ht / 30, fontWeight: FontWeight.w500),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BasicTimeField(),
            SizedBox(
              width: wd / 9,
              child: Center(
                child: Text(
                  "to",
                  style:
                      TextStyle(fontSize: ht / 40, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            BasicTimeField()
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
                onPressed: () => formKey.currentState?.save(),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                child: Text('Reset'),
                onPressed: () => formKey.currentState?.reset(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 100,
      child: DateTimeField(
        format: format,
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
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wd / 3,
      child: DateTimeField(
        format: format,
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

printIntAsDay(int day) {
  print('Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
}

String intDayToEnglish(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Monday';
  if (day % 7 == DateTime.tuesday % 7) return 'Tuesday';
  if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
  if (day % 7 == DateTime.thursday % 7) return 'Thursday';
  if (day % 7 == DateTime.friday % 7) return 'Friday';
  if (day % 7 == DateTime.saturday % 7) return 'Saturday';
  if (day % 7 == DateTime.sunday % 7) return 'Sunday';
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
            printIntAsDay(v);
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
