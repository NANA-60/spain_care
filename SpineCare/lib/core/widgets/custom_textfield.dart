import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final bool autofocus;

  // إضافات للسماح بتجاوز الثيم محلياً
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.autofocus = false,
    this.fillColor,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      obscureText: isPassword,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: fillColor ?? theme.colorScheme.surface,
        hintStyle: hintStyle ?? TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: textStyle ?? TextStyle(color: theme.colorScheme.onSurface),
    );
  }
}
