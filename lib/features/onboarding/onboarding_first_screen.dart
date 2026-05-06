import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/styles/styles_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/onboarding/widgets/onboarding-star_image.dart';
import 'package:health_tech/features/onboarding/widgets/skipbutton.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.white,
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
                    'Looking for the right doctor?',
                    textAlign: TextAlign.start,
                    style: StylesManager.black24,
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "We know how stressful it can be searching for the right  specialist and managing appointments. That’s why we built HealthTech .",
                      textAlign: TextAlign.start,
                      style: StylesManager.grey16,
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  PraimaryButtom(
                    text: 'Continue',
                    onpressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/onboarding_two',
                      );
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
