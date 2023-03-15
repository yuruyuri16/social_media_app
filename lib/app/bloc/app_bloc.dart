import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required UserRepository userRepository,
    required User user,
  })  : _userRepository = userRepository,
        super(
          user == User.anonymous
              ? const AppState.unauthenticated()
              : AppState.authenticated(user),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _userSubscription = _userRepository.user.listen(_userChanged);
  }

  late final StreamSubscription<User> _userSubscription;

  final UserRepository _userRepository;

  void _userChanged(User user) => add(AppUserChanged(user));

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    final user = event.user;
    if (user == User.anonymous) {
      emit(const AppState.unauthenticated());
    } else {
      emit(AppState.authenticated(user));
    }
  }

  Future<void> _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    await _userRepository.logInWithEmailAndPassword(email: '', password: '');
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
