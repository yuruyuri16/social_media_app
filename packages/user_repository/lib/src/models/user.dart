import 'package:authentication_client/authentication_client.dart';

/// {@template user}
/// User model represents the current user with subscription plan.
/// {@endtemplate}
class User extends AuthenticationUser {
  /// {@macro user}
  const User({
    required super.id,
    super.email,
    super.name,
    super.photo,
  });

  /// Converts [AuthenticationUser] to [User].
  factory User.fromAuthenticationUser({
    required AuthenticationUser authenticationUser,
  }) =>
      User(
        email: authenticationUser.email,
        id: authenticationUser.id,
        name: authenticationUser.name,
        photo: authenticationUser.photo,
      );

  @override
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const User anonymous = User(id: '');
}
