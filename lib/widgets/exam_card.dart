import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  ExamCard({required this.exam});

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.examDateTime.isBefore(DateTime.now());
    Color cardColor = isPast ? const Color.fromARGB(255, 225, 63, 63) : const Color.fromARGB(255, 117, 224, 121);

    return Card(
      color: cardColor,
      child: ListTile(
        title: Text(exam.subjectName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 4),
                Text('${exam.examDateTime.day}.${exam.examDateTime.month}.${exam.examDateTime.year}'),
                SizedBox(width: 16),
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
                Text('${exam.examDateTime.hour}:${exam.examDateTime.minute.toString().padLeft(2, '0')}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.room, size: 16),
                SizedBox(width: 4),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
