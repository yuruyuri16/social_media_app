// ignore_for_file: prefer_const_constructors
import 'package:firebase_user_client/firebase_user_client.dart';
import 'package:test/test.dart';

void main() {
  group('FirebaseUserClient', () {
    test('can be instantiated', () {
      expect(FirebaseUserClient(), isNotNull);
    });
  });
}
