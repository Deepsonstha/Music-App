import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/dependency_injection/app_injection.dart';
import 'package:music_app/features/bottom_nav_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:music_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:music_app/features/music/presentation/cubits/music_cubit/music_cubit.dart';

class ListBlocProvider {
  static get allBlocProvider => [
        BlocProvider<BottomNavBarCubit>(create: (context) => BottomNavBarCubit()),
        BlocProvider<HomeCubit>(create: (context) => locator<HomeCubit>()),
        BlocProvider<MusicCubit>(create: (context) => locator<MusicCubit>()),
      ];
}
