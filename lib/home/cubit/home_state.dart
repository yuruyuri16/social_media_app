part of 'home_cubit.dart';

enum HomeState {
  content(0, '/'),
  userProfile(1, '/user-profile');

  const HomeState(this.tabIndex, this.path);

  final int tabIndex;
  final String path;
}
