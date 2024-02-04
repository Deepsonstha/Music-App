import 'package:flutter/material.dart';
import 'package:music_app/configs/themes/app_palette.dart';
import 'package:music_app/configs/themes/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppPalette.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Musix Dash",
              style: Theme.of(context).appTextTheme.f22w7,
            ),
          ],
        ),
      ),
    );
  }
}
