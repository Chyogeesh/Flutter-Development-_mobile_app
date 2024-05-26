import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_project_name/models/student.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;

  StudentRepository() : _firestore = FirebaseFirestore.instance;

  Future<void> addStudent(Student student) async {
    await _firestore.collection('students').add(student.to
