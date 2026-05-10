import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffix,
    this.obscure = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: validator,

        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.secondaryColorLightBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorManager.greyColor, width: 1.5),
          ),
          hintText: hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
