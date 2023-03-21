import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

/// {@template firebase_authentication_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class FirebaseAuthenticationClient implements AuthenticationClient {
  /// {@macro firebase_authentication_client}
  FirebaseAuthenticationClient({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Future<AuthenticationUser> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        throw const LogInFailure('User is null');
      }
      return AuthenticationUser(id: user.uid, email: email);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LogInFailure(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogOutFailure(error), stackTrace);
    }
  }

  @override
  Future<AuthenticationUser> register({
    required String name,
    required String lastName,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        throw const RegisterFailure('User is null');
      }
      return AuthenticationUser(id: user.uid, email: email);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RegisterFailure(error),
        stackTrace,
      );
    }
  }
}
