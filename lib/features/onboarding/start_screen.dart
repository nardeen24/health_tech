import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/styles/styles_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/onboarding/widgets/onboarding-star_image.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          OnboardingStartImage(height: height),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.016),
                Text(
                  'Start Your Health Journey',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: height * 0.01),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "We are here to provide the innovative and integrated healthcare you deserve, anytime and anywhere.",
                    textAlign: TextAlign.start,
                    style: StylesManager.grey16,
                  ),
                ),
                SizedBox(height: height * 0.06),
                PraimaryButtom(
                  text: 'Get Started',
                  onpressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Color(0xFF6A6A6A)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: ColorManager.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
