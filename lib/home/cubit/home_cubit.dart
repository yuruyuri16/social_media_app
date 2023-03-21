import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.content);

  String setTab(int selectedTab) {
    late HomeState state;
    switch (selectedTab) {
      case 0:
        state = HomeState.content;
        break;
      case 1:
        state = HomeState.userProfile;
        break;
    }
    emit(state);
    return state.path;
  }
}
