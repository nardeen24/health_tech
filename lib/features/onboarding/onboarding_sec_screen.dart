import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/styles_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/onboarding/widgets/onboarding-star_image.dart';
import 'package:health_tech/features/onboarding/widgets/skipbutton.dart';

class OnboardingSecScreen extends StatelessWidget {
  const OnboardingSecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          OnboardingStartImage(height: height),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.016),
                  Text(
                    'Your health, just one tap away.',

                    textAlign: TextAlign.start,
                    style: StylesManager.onboardingPrimaryText,
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "With HealthTech, you can instantly book appointments, get reminders, and focus on what truly matters — your well-being. Ready to begin",
                      textAlign: TextAlign.start,
                      style: StylesManager.onboardingSecandaryText,
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  PraimaryButtom(
                    text: 'Continue',
                    onpressed: () {
                      Navigator.pushReplacementNamed(context, '/start');
                    },
                  ),
                  SizedBox(height: height * 0.018),
                  SkipButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
