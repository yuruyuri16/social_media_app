// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == AppStatus.authenticated;
}

class AppState extends Equatable {
  const AppState({
    required this.status,
    this.user = User.anonymous,
  });

  const AppState.authenticated(User user)
      : this(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];

  AppState copyWith({
    AppStatus? status,
    User? user,
  }) {
    return AppState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
