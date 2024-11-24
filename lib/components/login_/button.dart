import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class DefaultButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String title;
  final Color ?bgColor;
  final double btnWidth;
  final Color ?txtColor;
  final double borderRadius;
  final Color borderColor;


  const DefaultButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.title,
    required this.bgColor,
    required this.btnWidth,
    required this.txtColor,
    required this.borderRadius,
    required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.0,
              )
            : Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                    fontFamily: defaultFont,
                    letterSpacing: 0.8
                ),
              ),
      ),
    );
  }
}
