import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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

            SizedBox(width: width * 0.1),

            Text(
              "Or continue with",
              style: TextStyle(color: ColorManager.greyColor),
            ),

            SizedBox(width: width * 0.1),

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
        SizedBox(height: height * 0.001),
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
