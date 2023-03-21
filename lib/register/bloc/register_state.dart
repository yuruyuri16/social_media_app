// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.photo = const Photo.pure(),
    this.name = const Name.pure(),
    this.lastName = const LastName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.valid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Photo photo;
  final Name name;
  final LastName lastName;
  final Email email;
  final Password password;
  final Username username;
  final bool valid;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [
        photo,
        name,
        lastName,
        email,
        password,
        username,
        valid,
        status,
      ];

  RegisterState copyWith({
    Photo? photo,
    Name? name,
    LastName? lastName,
    Email? email,
    Password? password,
    Username? username,
    bool? valid,
    FormzSubmissionStatus? status,
  }) {
    return RegisterState(
      photo: photo ?? this.photo,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      valid: valid ?? this.valid,
      status: status ?? this.status,
    );
  }
}
