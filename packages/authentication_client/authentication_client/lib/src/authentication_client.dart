import 'package:authentication_client/authentication_client.dart';

/// {@template authentication_exception}
/// Exceptions from the authentication client.
/// {@endtemplate}
abstract class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template create_user_with_email_and_password_failure}
/// Thrown during the sign up with email and password process.
/// {@endtemplate}
class RegisterFailure extends AuthenticationException {
  /// {@macro create_user_with_email_and_password_failure}
  const RegisterFailure(super.error);
}

/// {@template log_in_failure}
/// Thrown during the sign in with email and password process
/// if a failure occurs.
/// {@endtemplate}
class LogInFailure extends AuthenticationException {
  /// {@macro log_in_failure}
  const LogInFailure(super.error);
}

/// {@template log_out_failure}
/// Thrown during the logout process if a failure occurs.
/// {@endtemplate}
class LogOutFailure extends AuthenticationException {
  /// {@macro log_out_failure}
  const LogOutFailure(super.error);
}

/// A generic Authentication Client Interface.
abstract class AuthenticationClient {
  /// Sign up with [email] and [password].
  ///
  /// Throws a [RegisterFailure] if an exception occurs.
  Future<AuthenticationUser> register({
    required String name,
    required String lastName,
    required String email,
    required String username,
    required String password,
  });

  /// Sign in with [email] and [password].
  ///
  /// Throws a [LogInFailure] if an exception occurs.
  Future<AuthenticationUser> login({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut();
}
