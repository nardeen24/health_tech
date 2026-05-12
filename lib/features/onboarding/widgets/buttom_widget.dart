import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
