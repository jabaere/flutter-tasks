import 'package:flutter/material.dart';

class CustomRowComponent extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool showCheckMark;

  const CustomRowComponent({
    super.key,
    required this.icon,
    required this.text,
    required this.showCheckMark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, size: 24),
              ),
              const SizedBox(width: 25),
              // Text
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),

          // Conditional Check Mark && Arrow




            Row(
              children: [
                if (showCheckMark)
                  const Icon(Icons.check, color: Colors.green),
                const SizedBox(width: 25),
                const Icon(Icons.arrow_forward_ios_rounded),

              ],
            ),

        ],
      ),
    );
  }
}
