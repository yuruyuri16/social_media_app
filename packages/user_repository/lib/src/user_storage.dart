part of 'user_repository.dart';

/// Storage keys for the [UserStorage].
abstract class UserStorageKeys {
  /// User information.
  static const user = '__user_key__';
}

/// {@template user_storage}
/// Storage for the [UserRepository].
/// {@endtemplate}
class UserStorage {
  /// {@macro user_storage}
  const UserStorage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  /// Sets the user information.
  Future<void> setUser({required User user}) async {
    final userEncoded = jsonEncode(user);
    await _storage.write(key: UserStorageKeys.user, value: userEncoded);
  }

  /// Fetches the user information from storage.
  Future<User> fetchUser() async {
    final userEncoded = await _storage.read(key: UserStorageKeys.user);
    if (userEncoded == null) return User.anonymous;
    final userDecoded = jsonDecode(userEncoded) as Map<String, dynamic>;
    final user = User.fromJson(userDecoded);
    return user;
  }
}
