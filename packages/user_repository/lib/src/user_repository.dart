import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:authentication_client/authentication_client.dart';
import 'package:rxdart/subjects.dart';
import 'package:storage/storage.dart';
import 'package:user_client/user_client.dart';
import 'package:user_repository/user_repository.dart';

part 'user_storage.dart';

/// {@template user_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    required AuthenticationClient authenticationClient,
    required UserClient userClient,
    required UserStorage storage,
  })  : _authenticationClient = authenticationClient,
        _userClient = userClient,
        _storage = storage,
        _userSubject = BehaviorSubject() {
    unawaited(_getUser());
  }

  final AuthenticationClient _authenticationClient;
  final UserClient _userClient;
  final UserStorage _storage;
  final BehaviorSubject<User> _userSubject;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  Stream<User> get user => _userSubject.asBroadcastStream();

  /// Signs up with [name], [lastName], [email], [username], [password] and
  /// a [photo].
  ///
  /// Throws a [RegisterFailure] if an exception occurs.
  Future<void> register({
    required String name,
    required String lastName,
    required String email,
    required String username,
    required String password,
    required File photo,
  }) async {
    try {
      final user = await _authenticationClient.register(
        name: name,
        lastName: lastName,
        email: email,
        username: username,
        password: password,
      );
      final photoUrl = await _userClient.uploadPhoto(
        userId: user.id,
        photo: photo,
      );
      await _userClient.createUser(
        userId: user.id,
        name: name,
        lastName: lastName,
        email: email,
        username: username,
        photoUrl: photoUrl,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RegisterFailure(error),
        stackTrace,
      );
    }
  }

  /// Signs in with [email] and [password].
  ///
  /// Throws a [LogInFailure] if an exception occurs.
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final authenticatedUser = await _authenticationClient.login(
        email: email,
        password: password,
      );
      final userDocument = await _userClient.fetchUser(
        userId: authenticatedUser.id,
      );
      final user = User(
        id: userDocument.id,
        name: userDocument.name,
        lastName: userDocument.lastName,
        username: userDocument.username,
        email: userDocument.email,
        photoUrl: userDocument.photoUrl,
      );
      await _storage.setUser(user: user);
      _userSubject.add(user);
    } on LogInFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LogInFailure(error),
        stackTrace,
      );
    }
  }

  /// Signs out the current user which will emit
  /// [User.anonymous] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await _authenticationClient.logOut();
    } on LogOutFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogOutFailure(error), stackTrace);
    }
  }

  Future<void> _getUser() async {
    final user = await _storage.fetchUser();
    _userSubject.add(user);
  }
}
