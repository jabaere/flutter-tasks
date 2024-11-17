import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          // Left gray line
          Expanded(
            child: Container(
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),

          // text
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                  fontFamily: defaultFont
              ),
            ),
          ),

          // Right gray line
          Expanded(
            child: Container(
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
