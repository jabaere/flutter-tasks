import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;


  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: defaultFont
          ),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Colors.blue),
          ),
          filled: true,
          fillColor: Colors
              .grey[100],
          contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16),
        ),
      ),
    );
  }
}
