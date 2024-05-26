import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project_name/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpRequested) {
      yield* _mapSignUpRequestedToState(event);
    } else if (event is LoginRequested) {
      yield* _mapLoginRequestedToState(event);
    } else if (event is SignOutRequested) {
      yield* _mapSignOutRequestedToState();
    }
  }

  Stream<AuthState> _mapSignUpRequestedToState(SignUpRequested event) async* {
    yield AuthLoading();
    try {
      await authRepository.signUp(event.email, event.password);
      yield AuthSignedUp();
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  Stream<AuthState> _mapLoginRequestedToState(LoginRequested event) async* {
    yield AuthLoading();
    try {
      await authRepository.login(event.email, event.password);
      yield AuthLoggedIn();
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  Stream<AuthState> _mapSignOutRequestedToState() async* {
    yield AuthLoading();
    try {
      await authRepository.signOut();
      yield AuthLoggedOut();
    } catch (e) {
      yield AuthError(e.toString());
    }
  }
}
