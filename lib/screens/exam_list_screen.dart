import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber = "223052"; // стави го твојот број на индекс

  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(subject: 'Софтверско инженерство', dateTime: DateTime(2025, 1, 10, 9, 0), rooms: ['A2']),
    Exam(subject: 'Математика', dateTime: DateTime(2025, 1, 13, 11, 0), rooms: ['B1']),
    Exam(subject: 'Бази на податоци', dateTime: DateTime(2025, 1, 18, 10, 30), rooms: ['Lab 3']),
    Exam(subject: 'Маркетинг', dateTime: DateTime(2025, 1, 21, 9, 0), rooms: ['A1']),
    Exam(subject: 'Економија', dateTime: DateTime(2025, 1, 25, 12, 0), rooms: ['B4']),
    Exam(subject: 'Архитектура и организација на компјутери', dateTime: DateTime(2025, 1, 27, 8, 0), rooms: ['C2']),
    Exam(subject: 'Машинско учење', dateTime: DateTime(2025, 2, 2, 9, 0), rooms: ['Lab 1']),
    Exam(subject: 'Менаџмент', dateTime: DateTime(2025, 2, 7, 11, 0), rooms: ['A3']),
    Exam(subject: 'Веб програмирање', dateTime: DateTime(2025, 2, 10, 10, 30), rooms: ['D2']),
    Exam(subject: 'Електронска и мобилна трговија', dateTime: DateTime(2025, 2, 14, 13, 0), rooms: ['C1']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(exam: exam);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.indigo[50],
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
