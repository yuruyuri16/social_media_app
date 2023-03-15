import 'package:flutter/material.dart';
import 'package:social_media_app/login/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginForm()),
    );
  }
}
