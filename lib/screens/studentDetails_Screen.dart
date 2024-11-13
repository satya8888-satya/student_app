import 'package:flutter/material.dart';
import 'package:flutter_1/models/student.dart';

class StudentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)!.settings.arguments as Student;

    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8.0),
            Text('Roll Number: ${student.rollNumber}'),
            Text('Course: ${student.course}'),
            Text('Semester: ${student.semester}'),
            SizedBox(height: 16.0),
            Text('Fee Details', style: Theme.of(context).textTheme.titleLarge),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Fee: \$${student.totalFee}'),
                    SizedBox(height: 8.0),
                    Text('Payments:'),
                    ...student.feePayments
                        .map((payment) => Text('- \$$payment'))
                        .toList(),
                    Text(
                      'Balance: \$${student.totalFee - student.feePayments.reduce((a, b) => a + b)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Module Grades',
                style: Theme.of(context).textTheme.titleLarge),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: student.moduleGrades.entries
                      .map((entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              '${entry.key}: ${entry.value}%',
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
