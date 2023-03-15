import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';

/// {@template firebase_authentication_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class FirebaseAuthenticationClient implements AuthenticationClient {
  /// {@macro firebase_authentication_client}
  FirebaseAuthenticationClient({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Stream<AuthenticationUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthenticationUser.anonymous
          : firebaseUser.toUser;
    });
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const LogInWithGoogleCanceled('Sign in with google canceled');
      }
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on LogInWithGoogleCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInWithGoogleFailure(error), stackTrace);
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LogInWithEmailAndPasswordFailure(error),
        stackTrace,
      );
    }
  }
}

extension on firebase_auth.User {
  AuthenticationUser get toUser {
    return AuthenticationUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}
