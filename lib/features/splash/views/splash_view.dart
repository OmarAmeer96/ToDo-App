import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/features/note/presentation/views/notes_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        "assets/json/splash_view.json",
        width: 200,
        height: 200,
      ),
      backgroundColor: const Color(0xff1c1c1c),
      nextScreen: const NotesView(),
      splashIconSize: 350,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
