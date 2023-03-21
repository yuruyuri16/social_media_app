import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:social_media_app/register/register.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollableColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      children: [
        _PhotoField(),
        _NameField(),
        _LastNameField(),
        _EmailField(),
        _PasswordField(),
        _UsernameField(),
        _RegisterButton(),
      ],
    );
  }
}

class _PhotoField extends StatelessWidget {
  const _PhotoField();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xxlg),
      width: size.width * 0.4,
      height: size.width * 0.4,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: GestureDetector(
        onTap: () async => showModalBottomSheet(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<RegisterBloc>(),
            child: const PhotoBottomSheet(),
          ),
        ),
        child: BlocSelector<RegisterBloc, RegisterState, Photo>(
          selector: (state) => state.photo,
          builder: (_, photo) {
            final file = photo.value;
            if (file == null) return const PhotoEmpty();
            return PhotoSelected(photo: file);
          },
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (name) =>
          context.read<RegisterBloc>().add(RegisterNameChanged(name)),
      labelText: 'Name',
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (lastName) =>
          context.read<RegisterBloc>().add(RegisterLastNameChanged(lastName)),
      labelText: 'Last name',
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return AppEmailTextField(
      onChanged: (email) =>
          context.read<RegisterBloc>().add(RegisterEmailChanged(email)),
      labelText: 'Email',
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (password) =>
          context.read<RegisterBloc>().add(RegisterPasswordChanged(password)),
      obscureText: true,
      labelText: 'Password',
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: (username) =>
          context.read<RegisterBloc>().add(RegisterUsernameChanged(username)),
      labelText: 'Username',
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return AppButton.blueCharcoal(
      onPressed: () => context.read<RegisterBloc>().add(RegisterSubmitted()),
      child: const Text('Register'),
    );
  }
}
