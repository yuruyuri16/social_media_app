import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_app/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollableColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      children: [
        _EmailField(),
        _PasswordField(),
        _LoginButton(),
        // SizedBox(height: AppSpacing.lg),
        // _GoogleLoginButton(),
        SizedBox(height: AppSpacing.lg),
        _RegisterButton(),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return AppEmailTextField(
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      labelText: 'Email',
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      autocorrect: false,
      obscureText: true,
      onChanged: (password) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      // prefix: const Icon(Icons.lock),
      labelText: 'Password',
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return AppButton.blueCharcoal(
      onPressed: () =>
          context.read<LoginBloc>().add(const LoginEmailAndPasswordSubmitted()),
      child: const Text('Log in'),
    );
  }
}

// class _GoogleLoginButton extends StatelessWidget {
//   const _GoogleLoginButton();

//   @override
//   Widget build(BuildContext context) {
//     return AppButton.outlinedWhite(
//       onPressed: () => context.read<LoginBloc>().add(LoginGoogleSubmitted()),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Assets.icons.google.svg(),
//           const SizedBox(width: AppSpacing.lg),
//           Padding(
//             padding: const EdgeInsets.only(top: AppSpacing.xxs),
//             child: Assets.images.continueWithGoogle.svg(),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: 'Register',
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.push('/register'),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    // return ElevatedButton(
    //   onPressed: () => context.push('/register'),
    //   child: const Text('Register'),
    // );
  }
}
