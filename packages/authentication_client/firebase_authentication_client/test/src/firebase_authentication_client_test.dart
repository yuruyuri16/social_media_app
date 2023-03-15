// ignore_for_file: prefer_const_constructors
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:test/test.dart';

void main() {
  group('FirebaseAuthenticationClient', () {
    test('can be instantiated', () {
      expect(FirebaseAuthenticationClient(), isNotNull);
    });
  });
}
