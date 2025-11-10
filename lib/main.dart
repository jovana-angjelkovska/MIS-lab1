import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String indexNumber = '221040';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamListScreen(indexNumber: indexNumber),
    );
  }
}
