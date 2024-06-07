import 'package:flutter/material.dart';
import '../models/student_request.dart';

class StudentRequestsScreen extends StatelessWidget {
  final List<StudentRequest> studentRequests = [
    StudentRequest(studentName: 'Alice Smith', message: 'I need help with Algebra.'),
    StudentRequest(studentName: 'Bob Johnson', message: 'Can we schedule a session for Geometry?'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: studentRequests.length,
      itemBuilder: (context, index) {
        final request = studentRequests[index];
        return ListTile(
          title: Text(request.studentName),
          subtitle: Text(request.message),
        );
      },
    );
  }
}
