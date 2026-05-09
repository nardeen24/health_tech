import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class SpecializCircle extends StatelessWidget {
  const SpecializCircle({super.key, required this.image, required this.label});
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40, backgroundImage: AssetImage(image)),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
