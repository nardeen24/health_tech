import 'package:flutter/material.dart';
import 'package:health_tech/features/onboarding/widgets/buttom_widget.dart';
import 'package:health_tech/features/onboarding/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (pageController.page != null && pageController.page! < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/signup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          OnboardingPage(
            title: 'Looking for the right doctor?',
            buttomText: 'Continue',
            description:
                "We know how stressful it can be searching for the right  specialist and managing appointments. That’s why we built HealthTech .",
            onpressed: nextPage,
            showSkipButton: true,
          ),
          OnboardingPage(
            title: 'Health In One Tap',
            buttomText: 'Continue',
            description:
                "With HealthTech, you can instantly book appointments, get reminders, and focus on what truly matters — your well-being.Ready to begin",
            onpressed: nextPage,
            showSkipButton: true,
          ),
          OnboardingPage(
            description:
                "We are here to provide the innovative and integrated healthcare you deserve, anytime and anywhere.",
            title: 'Start Your Health Journey',
            onpressed: nextPage,
            buttomText: 'Get Started',
            showSkipButton: false,
            bottomWidget: ButtomWidget(),
          ),
        ],
      ),
    );
  }
}
