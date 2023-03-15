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

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// {@endtemplate}
class LogInWithGoogleFailure extends AuthenticationException {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure(super.error);
}

/// {@template log_in_with_google_canceled}
/// Thrown during the sign in with google process if it's canceled.
/// {@endtemplate}
class LogInWithGoogleCanceled extends AuthenticationException {
  /// {@macro log_in_with_google_canceled}
  const LogInWithGoogleCanceled(super.error);
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the sign in with email and password process
/// if a failure occurs.
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure extends AuthenticationException {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure(super.error);
}

/// A generic Authentication Client Interface.
abstract class AuthenticationClient {
  /// Stream of [AuthenticationUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AuthenticationUser.anonymous] if the user is not authenticated.
  Stream<AuthenticationUser> get user;

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle();

  /// Sign in with [email] and [password].
  ///
  /// Throws a [LogInWithGoogleCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
