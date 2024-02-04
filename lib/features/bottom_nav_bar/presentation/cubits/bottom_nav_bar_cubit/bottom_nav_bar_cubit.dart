import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/bottom_nav_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState.initial());
  void changeIndex({required int index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}
