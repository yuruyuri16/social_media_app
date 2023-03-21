import 'package:equatable/equatable.dart';

///
class UserDocument extends Equatable {
  ///
  const UserDocument({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  ///
  factory UserDocument.fromJson(Map<String, dynamic>? json) => json == null
      ? UserDocument.empty
      : UserDocument(
          id: json['id'] as String,
          name: json['name'] as String,
          lastName: json['lastName'] as String,
          email: json['email'] as String,
          username: json['username'] as String,
          photoUrl: json['photoUrl'] as String,
          followers: json['followers'] as List,
          following: json['following'] as List,
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
  final List<dynamic> followers;

  ///
  final List<dynamic> following;

  /// Empty user document which represents it does not exist.
  static const empty = UserDocument(
    id: '',
    name: '',
    lastName: '',
    email: '',
    username: '',
    photoUrl: '',
    followers: [],
    following: [],
  );

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'username': username,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following,
      };

  @override
  List<Object> get props => [
        id,
        name,
        lastName,
        email,
        username,
        photoUrl,
        followers,
        following,
      ];
}
