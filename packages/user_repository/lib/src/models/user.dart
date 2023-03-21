import 'package:equatable/equatable.dart';

/// {@template user}
/// User model represents the current user with subscription plan.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.username,
    required this.photoUrl,
  });

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        photoUrl: json['photoUrl'] as String,
      );

  ///
  final String id;

  ///
  final String name;

  ///
  final String lastName;

  ///
  final String email;

  ///
  final String username;

  ///
  final String photoUrl;

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'username': username,
        'photoUrl': photoUrl,
      };

  ///
  bool get isAnonymous => this == anonymous;

  ///
  static const anonymous = User(
    id: '',
    name: '',
    lastName: '',
    email: '',
    username: '',
    photoUrl: '',
  );

  @override
  List<Object> get props => [id, name, lastName, email, username, photoUrl];
}
