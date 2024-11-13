class Student {
  final String id;
  final String name;
  final String rollNumber;
  final String course;
  final int semester;
  final List<double> feePayments;
  final double totalFee;
  final Map<String, double> moduleGrades;

  Student({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.course,
    required this.semester,
    required this.feePayments,
    required this.totalFee,
    required this.moduleGrades,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rollNumber': rollNumber,
      'course': course,
      'semester': semester,
      'feePayments': feePayments,
      'totalFee': totalFee,
      'moduleGrades': moduleGrades,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map, String id) {
    return Student(
      id: id,
      name: map['name'],
      rollNumber: map['rollNumber'],
      course: map['course'],
      semester: map['semester'],
      feePayments: List<double>.from(map['feePayments']),
      totalFee: map['totalFee'],
      moduleGrades: Map<String, double>.from(map['moduleGrades']),
    );
  }
}
