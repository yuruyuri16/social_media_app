import 'package:authentication_client/authentication_client.dart';
import 'package:user_repository/user_repository.dart';

/// {@template user_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  const UserRepository({
    required AuthenticationClient authenticationClient,
  }) : _authenticationClient = authenticationClient;

  final AuthenticationClient _authenticationClient;

  /// Stream of [User] which will emit the current user when
  /// the authentication state or the subscription plan changes.
  Stream<User> get user => _authenticationClient.user.map(
        (authauthenticationUserUser) => User.fromAuthenticationUser(
          authenticationUser: authauthenticationUserUser,
        ),
      );

  /// Signs in with [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationClient.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on LogInWithEmailAndPasswordFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInWithGoogleFailure(error), stackTrace);
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      await _authenticationClient.logInWithGoogle();
    } on LogInWithGoogleFailure {
      rethrow;
    } on LogInWithGoogleCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInWithGoogleFailure(error), stackTrace);
    }
  }
}
