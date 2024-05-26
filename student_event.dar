part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class AddStudent extends StudentEvent {
  final Student student;

  AddStudent(this.student);

  @override
  List<Object> get props => [student];
}

class LoadStudents extends StudentEvent {}
