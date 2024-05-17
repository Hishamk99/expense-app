import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText, this.textInputType = TextInputType.number,
  });
  final String hintText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        
      ),
    );
  }
}