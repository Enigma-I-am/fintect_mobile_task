import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/services/services.dart';
import 'package:fintech_mobile_task/presentation/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme.copyWith();
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigator.key,
        theme: ThemeData(
          fontFamily: FontFamily.helveticaNeueCyr,
          primaryColor: const Color(0xFFff2d63),
          // textTheme: GoogleFonts.interTextTheme(textTheme),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF0e174d),
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFFff2d63),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // side: BorderSide(color: Colors.red)
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                const Size(173, 60),
              ),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFFff2d63),
          ),
          scaffoldBackgroundColor: const Color(0xFF010A43),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
