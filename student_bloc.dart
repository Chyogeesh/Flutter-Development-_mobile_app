import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project_name/models/student.dart';
import 'package:your_project_name/repositories/student_repository.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;

  StudentBloc(this.studentRepository) : super(StudentInitial());

  @override
  Stream<StudentState> mapEventToState(StudentEvent event) async* {
    if (event is AddStudent) {
      yield* _mapAddStudentToState(event);
    } else if (event is LoadStudents) {
      yield* _mapLoadStudentsToState();
    }
  }

  Stream<StudentState> _mapAddStudentToState(AddStudent event) async* {
    yield StudentLoading();
    try {
      await studentRepository.addStudent(event.student);
      yield StudentAdded();
    } catch (e) {
      yield StudentError(e.toString());
    }
  }

  Stream<StudentState> _mapLoadStudentsToState() async* {
    yield StudentLoading();
    try {
      final students = await studentRepository.getStudents();
      yield StudentsLoaded(students);
    } catch (e) {
      yield StudentError(e.toString());
    }
  }
}
