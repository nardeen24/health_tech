import 'package:flutter/material.dart';

class OnboardingStartImage extends StatelessWidget {
  const OnboardingStartImage({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(75)),
      child: Image.asset(
        'assets/images/onboarding_image.png',
        width: double.infinity,
        height: height * 0.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
