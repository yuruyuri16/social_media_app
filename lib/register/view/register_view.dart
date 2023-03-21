import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_app/register/register.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: const Text('Register'),
      ),
      body: const RegisterForm(),
    );
  }
}
