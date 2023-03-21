import 'package:equatable/equatable.dart';

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    required this.email,
  });

  /// The current user's email address.
  final String email;

  /// The current user's id.
  final String id;

  /// Whether the current user is anonymous.
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthenticationUser(id: '', email: '');

  @override
  List<Object?> get props => [email, id];
}
