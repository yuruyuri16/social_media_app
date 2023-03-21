part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterPhotoSelected extends RegisterEvent {
  const RegisterPhotoSelected(this.file);

  final File file;

  @override
  List<Object> get props => [file];
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegisterLastNameChanged extends RegisterEvent {
  const RegisterLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class RegisterSubmitted extends RegisterEvent {}
