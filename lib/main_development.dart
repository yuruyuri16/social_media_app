import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:social_media_app/app/app.dart';
import 'package:social_media_app/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(() async {
    final authenticationClient = FirebaseAuthenticationClient();
    final userRepository = UserRepository(
      authenticationClient: authenticationClient,
    );
    return App(
      userRepository: userRepository,
      user: await userRepository.user.first,
    );
  });
}
