import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../styles/app_styles.dart';

class PrivacyPolicyText extends StatelessWidget {

  const PrivacyPolicyText({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(
                  color: AppTheme.helperTextCol,
                  fontSize:  15 ,
                  letterSpacing: 0.8,
                  fontFamily: defaultFont
                ),
              ),
              TextSpan(
                text: 'Terms, ',
                style: TextStyle(
                  color: AppTheme.linkTextCol,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: defaultFont
                ),


              ),
              TextSpan(
                text: 'Privacy Policy, ',
                style: TextStyle(
                  color: AppTheme.linkTextCol,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: defaultFont
                ),


              ),
              TextSpan(
                text: 'and ',
                style: TextStyle(
                  color: AppTheme.helperTextCol,
                  fontSize:  15 ,
                  letterSpacing: 0.8,
                  fontFamily: defaultFont
                ),
              ),
              TextSpan(
                text: 'Cookies Policy',
                style: TextStyle(
                  color: AppTheme.linkTextCol,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: defaultFont
                ),


              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
