import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/app.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.select((AppBloc bloc) => bloc.state.user.username);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(username),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
              horizontal: AppSpacing.lg,
            ),
            child: Column(
              children: const [
                _UserInfo(),
              ],
            ),
          ),
          const Expanded(child: _Posts()),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const CircleAvatar(
          radius: 44,
          backgroundImage: NetworkImage(
            'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQJlwSiVSYPSDq3WyLiDm8KUZyUwX8z8DskuvOC9u3ENsxbGPRa_Ah3odil3LKaZOU8Ev-ZYZ9fBcqqrfA',
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Spacer(flex: 2),
              Column(
                children: [
                  Text(
                    '83',
                    style: theme.textTheme.titleSmall,
                  ),
                  const Text('Posts'),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '171',
                    style: theme.textTheme.titleSmall,
                  ),
                  const Text('Followers'),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '278',
                    style: theme.textTheme.titleSmall,
                  ),
                  const Text('Following'),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        )
      ],
    );
  }
}

class _Posts extends StatelessWidget {
  const _Posts();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          'https://media.istockphoto.com/id/636810092/es/foto/miraflores-en-lima-per%C3%BA.jpg?s=612x612&w=0&k=20&c=5z06raLfZyY-wQs3PJzFc0m77nbdKnLpinLIF-wu7z8=',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
