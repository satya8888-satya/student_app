import 'package:flutter/material.dart';
import 'package:flutter_1/models/student.dart';

import '../service/authservice.dart';
import '../service/studentService.dart';

class HomeScreen extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Student>>(
        stream: _databaseService.getStudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final students = snapshot.data!;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text('Roll No: ${student.rollNumber}'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/student-details',
                    arguments: student,
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-student');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
