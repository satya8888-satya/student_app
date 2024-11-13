import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_1/models/student.dart';

class DatabaseService {
  final CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('students');

  Future<void> addStudent(Student student) async {
    await studentsCollection.doc(student.id).set(student.toMap());
  }

  Future<void> updateStudent(Student student) async {
    await studentsCollection.doc(student.id).update(student.toMap());
  }

  Stream<List<Student>> getStudents() {
    return studentsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }
}
