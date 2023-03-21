import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:firebase_user_client/firebase_user_client.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:social_media_app/app/app.dart';
import 'package:social_media_app/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(() async {
    final authenticationClient = FirebaseAuthenticationClient();
    final userClient = FirebaseUserClient();
    const secureStorage = SecureStorage();
    const userStorage = UserStorage(storage: secureStorage);
    final userRepository = UserRepository(
      authenticationClient: authenticationClient,
      userClient: userClient,
      storage: userStorage,
    );
    return App(
      userRepository: userRepository,
      user: await userRepository.user.first,
    );
  });
}
