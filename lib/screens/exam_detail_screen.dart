import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  ExamDetailScreen({required this.exam});

  String getTimeLeft() {
    final now = DateTime.now();
    final diff = exam.examDateTime.difference(now);

    int days = diff.inDays;
    int hours = diff.inHours % 24;
    if (diff.isNegative) {
      return 'Испитот е поминат';
    }
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Предмет: ${exam.subjectName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text('Датум: ${exam.examDateTime.day}.${exam.examDateTime.month}.${exam.examDateTime.year}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 8),
                Text('Време: ${exam.examDateTime.hour}:${exam.examDateTime.minute.toString().padLeft(2, '0')}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.room),
                SizedBox(width:8),
                Text('Простории: ${exam.rooms.join(', ')}'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Време до испитот: ${getTimeLeft()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
