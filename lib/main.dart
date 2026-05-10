import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/features/auth/cubit/auth_cubit.dart';
import 'package:health_tech/features/auth/login/login_screen.dart';
import 'package:health_tech/features/auth/signup/signup_screen.dart';
import 'package:health_tech/features/doctors/cubit/doctor_cubit.dart';
import 'package:health_tech/features/favorites/favorites_screen.dart';
import 'package:health_tech/features/home/home_screen.dart';
import 'package:health_tech/features/home/main_navigation/main_navigation.dart';
import 'package:health_tech/features/onboarding/onboarding_screen.dart';
import 'package:health_tech/features/splash/splash_screen.dart';
import 'package:health_tech/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding_page': (context) => const OnboardingScreen(),
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const SignupScreen(),
            '/mainNavigation': (context) => MainNavigation(),
            '/home': (context) => const HomeScreen(),
            '/favorites': (context) => const FavoritesScreen(),
          },
        ),
      ),
    );
  }
}
