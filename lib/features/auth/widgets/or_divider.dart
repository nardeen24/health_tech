import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, ColorManager.greyColor],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            Text(
              "Or continue with",
              style: TextStyle(color: ColorManager.greyColor),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.textSecondaryColor,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.g_mobiledata_rounded),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.facebook_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.apple_rounded)),
          ],
        ),
      ],
    );
  }
}
