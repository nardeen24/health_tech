import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/styles/styles_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/onboarding/widgets/onboarding_star_image.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String buttomText;
  final VoidCallback onpressed;
  final bool showSkipButton;
  final Widget? bottomWidget;
  const OnboardingPage({
    super.key,
    required this.description,
    required this.title,
    required this.onpressed,
    required this.buttomText,
    required this.showSkipButton,
    this.bottomWidget
  });

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
                    title,
                    textAlign: TextAlign.start,
                    style: StylesManager.black24,
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      description,
                      textAlign: TextAlign.start,
                      style: StylesManager.grey16,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  PraimaryButtom(text: buttomText, onpressed: onpressed),

                  if (showSkipButton) ...[
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/start');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: ColorManager.secondaryColorLightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),



                  ],
                
                 if (bottomWidget != null) ...[
                    SizedBox(height: height * 0.01),
                    bottomWidget!,
                  ],
                ],
              ),
            ),
          ),  
        ],
      ),
    );
  }
}
