import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._userRepository) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginEmailAndPasswordSubmitted>(_onEmailAndPasswordSubmitted);
    on<LoginGoogleSubmitted>(_onGoogleSubmitted);
  }

  final UserRepository _userRepository;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    final valid = Formz.validate([email, state.password]);
    emit(state.copyWith(email: email, valid: valid));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    final valid = Formz.validate([state.email, password]);
    emit(state.copyWith(password: password, valid: valid));
  }

  Future<void> _onEmailAndPasswordSubmitted(
    LoginEmailAndPasswordSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onGoogleSubmitted(
    LoginGoogleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _userRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleCanceled {
      emit(state.copyWith(status: FormzSubmissionStatus.canceled));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
