import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon prefix;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.prefix,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 2) {
          return 'Please enter at least 2 characters';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        hintText: hint,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
