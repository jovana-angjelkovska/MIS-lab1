import 'package:flutter/material.dart';
import '../widgets/exam_card.dart';
import '../data/exams.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber;
  ExamListScreen({required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.examDateTime.compareTo(b.examDateTime));
    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (ctx, i) => ExamCard(exam: exams[i]),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Text(
          'Вкупно испити: ${exams.length}',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
