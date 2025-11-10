import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      color: isPast ? Colors.grey[200] : Colors.lightBlue[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
        leading: Icon(
          Icons.book_rounded,
          color: isPast ? Colors.grey : Colors.indigo,
        ),
        title: Text(
          exam.subject,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.calendar_month, size: 16),
              const SizedBox(width: 6),
              Text(DateFormat('dd.MM.yyyy • HH:mm').format(exam.dateTime)),
            ]),
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 6),
              Text(exam.rooms.join(', ')),
            ]),
          ],
        ),
      ),
    );
  }
}
