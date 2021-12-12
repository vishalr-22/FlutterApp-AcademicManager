import 'package:acadmt/calendar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(calendarpage());
}

class calendarpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Event Calendar",
      home: Calendar(),
      
    );
  }
}
