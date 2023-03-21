import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/app.dart';
import 'package:social_media_app/content/content.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () =>
                context.read<AppBloc>().add(const AppLogoutRequested()),
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: ListView(
        children: const [
          PostCard(),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }
}
