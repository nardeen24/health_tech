import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:health_tech/features/auth/login/login_screen.dart';
import 'package:health_tech/features/auth/signup/signup_screen.dart';
import 'package:health_tech/features/home/home_screen.dart';
import 'package:health_tech/features/onboarding/onboarding_first_screen.dart';
import 'package:health_tech/features/onboarding/onboarding_sec_screen.dart';
import 'package:health_tech/features/onboarding/start_screen.dart';
import 'package:health_tech/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/onboarding_one': (context) => const OnboardingFirstScreen(),
          '/onboarding_two': (context) => const OnboardingSecScreen(),
          '/start': (context) => StartScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
