part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentAdded extends StudentState {}

class StudentsLoaded extends StudentState {
  final List<Student> students;

  StudentsLoaded(this.students);

  @override
  List<Object> get props => [students];
}

class StudentError extends StudentState {
  final String error;

  StudentError(this.error);

  @override
  List<Object> get props => [error];
}
