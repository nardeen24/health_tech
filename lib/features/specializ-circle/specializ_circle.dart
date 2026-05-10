import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class SpecializCircle extends StatelessWidget {
  const SpecializCircle({
    super.key,
    required this.image,
    required this.label,
    this.onTap, 
  });

  final String image;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
