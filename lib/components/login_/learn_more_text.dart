import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class LearnMoreText extends StatelessWidget {

  const LearnMoreText({
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
                text: 'People who use our service may have uploaded your contact information to Instagram. ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize:  15 ,
                  letterSpacing: 0.5,
                  fontFamily: defaultFont
                ),
              ),
              TextSpan(
                text: 'Learn more ',
                style: TextStyle(
                  color: Colors.blue,  // Link color
                  decoration: TextDecoration.none,
                  fontSize: 15,
                    letterSpacing: 0.8,
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
