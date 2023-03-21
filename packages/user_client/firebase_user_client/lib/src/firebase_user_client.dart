import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_client/user_client.dart';

/// {@template firebase_user_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class FirebaseUserClient implements UserClient {
  /// {@macro firebase_user_client}
  FirebaseUserClient({
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  CollectionReference<UserDocument> get _users =>
      _firebaseFirestore.collection('users').withConverter(
        fromFirestore: (snapshot, _) {
          return UserDocument.fromJson(snapshot.data());
        },
        toFirestore: (userDocument, _) {
          return userDocument.toJson();
        },
      );

  Reference get _storage => _firebaseStorage.ref();
  Reference get _profilePics => _storage.child('profile-pictures');

  @override
  Future<void> createUser({
    required String userId,
    required String name,
    required String lastName,
    required String email,
    required String username,
    required String photoUrl,
  }) async {
    try {
      final userDocument = UserDocument(
        id: userId,
        name: name,
        lastName: lastName,
        email: email,
        username: username,
        photoUrl: photoUrl,
        followers: const [],
        following: const [],
      );
      await _users.doc(userId).set(userDocument);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<String> uploadPhoto({
    required String userId,
    required File photo,
  }) async {
    try {
      final uploadTask = await _profilePics.child(userId).putFile(photo);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<UserDocument> fetchUser({
    required String userId,
  }) async {
    try {
      final snapshot = await _users.doc(userId).get();
      final userDocument = snapshot.data();
      if (userDocument == null) throw Exception('User does not exist.');
      return userDocument;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
