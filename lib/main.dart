import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/configs/routes/route.dart';
import 'package:music_app/configs/themes/app_theme.dart';
import 'package:music_app/core/bloc/bloc_list_provider.dart';
import 'package:music_app/dependency_injection/app_injection.dart';
import 'features/bottom_nav_bar/presentation/pages/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ListBlocProvider.allBlocProvider,
      child: ScreenUtilInit(
        // designSize: MediaQuery.of(context).size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Musix Dash',
            debugShowCheckedModeBanner: false,
            getPages: routes,
            darkTheme: AppTheme.dark,
            theme: AppTheme.light,
            home: BottomNavBar(),
          );
        },
      ),
    );
  }
}
