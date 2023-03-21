import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._userRepository) : super(const RegisterState()) {
    on<RegisterPhotoSelected>(_onPhotoSelected);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;

  void _onPhotoSelected(
    RegisterPhotoSelected event,
    Emitter<RegisterState> emit,
  ) {
    final photo = Photo.dirty(event.file);
    final valid = Formz.validate([
      photo,
      state.name,
      state.lastName,
      state.email,
      state.password,
      state.username,
    ]);
    emit(state.copyWith(photo: photo, valid: valid));
  }

  void _onNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final name = Name.dirty(event.name);
    final valid = Formz.validate([
      state.photo,
      name,
      state.lastName,
      state.email,
      state.password,
      state.username,
    ]);
    emit(state.copyWith(name: name, valid: valid));
  }

  void _onLastNameChanged(
    RegisterLastNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final lastName = LastName.dirty(event.lastName);
    final valid = Formz.validate([
      state.photo,
      state.name,
      lastName,
      state.email,
      state.password,
      state.username,
    ]);
    emit(state.copyWith(lastName: lastName, valid: valid));
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    final valid = Formz.validate([
      state.photo,
      state.name,
      state.lastName,
      email,
      state.password,
      state.username,
    ]);
    emit(state.copyWith(email: email, valid: valid));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    final valid = Formz.validate([
      state.photo,
      state.name,
      state.lastName,
      state.email,
      password,
      state.username,
    ]);
    emit(state.copyWith(password: password, valid: valid));
  }

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final username = Username.dirty(event.username);
    final valid = Formz.validate([
      state.photo,
      state.name,
      state.lastName,
      state.email,
      state.password,
      username,
    ]);
    emit(state.copyWith(username: username, valid: valid));
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.valid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.register(
        email: state.email.value.trim(),
        password: state.password.value.trim(),
        username: state.username.value.trim(),
        name: state.name.value.trim(),
        lastName: state.lastName.value.trim(),
        photo: state.photo.value!,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
