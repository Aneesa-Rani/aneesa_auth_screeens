import 'package:flutter/material.dart';
import '../Core/app_color.dart';


class AuthField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;
  final VoidCallback? onSuffixTap;
  final bool showSuffix;

  const AuthField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.onSuffixTap,
    this.showSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(
          color: AppColors.dark,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            icon,
            color: AppColors.grey,
            size: 21,
          ),

          suffixIcon: showSuffix
              ? IconButton(
            onPressed: onSuffixTap,
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.grey,
              size: 20,
            ),
          )
              : null,

          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 13,
          ),

          contentPadding:
          const EdgeInsets.symmetric(
            vertical: 17,
          ),
        ),
      ),
    );
  }
}