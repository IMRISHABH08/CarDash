import 'package:flutter/material.dart';

import '../design_system/styles/colors.dart';
import '../design_system/styles/sizing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Indra.lightBlue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/splash_flutter_logo.png',
            height: SpaceX.px100,
            width: SpaceX.px100,
          ),
          const SizedBox(height: SpaceX.px80),
          const CircularProgressIndicator(color: Indra.white)
        ],
      ),
    );
  }
}
