import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType = TextInputType.number,
    this.onSaved,
   this. maxLen = 2
  });
  final String hintText;
  final TextInputType textInputType;
  final int maxLen;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      maxLength: maxLen,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
