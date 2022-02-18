import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.onChanged,
    this.hintText = '',
    this.obscureText = false,
    this.errorText,
  }) : super(key: key);

  final String hintText;
  final String? errorText;
  final bool obscureText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }
}
