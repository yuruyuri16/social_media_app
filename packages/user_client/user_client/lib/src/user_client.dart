import 'dart:io';

import 'package:user_client/src/models/user_document.dart';

/// {@template user_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class UserClient {
  /// {@macro user_client}
  const UserClient();

  ///
  Future<void> createUser({
    required String userId,
    required String name,
    required String lastName,
    required String email,
    required String username,
    required String photoUrl,
  });

  ///
  Future<UserDocument> fetchUser({
    required String userId,
  });

  ///
  Future<String> uploadPhoto({
    required String userId,
    required File photo,
  });
}
