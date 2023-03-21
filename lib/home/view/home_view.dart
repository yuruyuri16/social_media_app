import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_app/home/home.dart';
import 'package:social_media_app/navigation/view/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedTab,
        onTap: (tab) => context.go(context.read<HomeCubit>().setTab(tab)),
      ),
    );
  }
}
