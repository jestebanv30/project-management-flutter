import 'package:flutter/material.dart';
import 'package:project_management/core/utils/app_color.dart';

class TextfieldSufix extends StatelessWidget {
  const TextfieldSufix({super.key, required this.icon, this.size = 18});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: darkBackgroundColor,
          // boxShadow: const [
          //   BoxShadow(color: Colors.grey, offset: Offset(1, 0)),
          //   BoxShadow(color: Colors.grey, offset: Offset(0, 1)),
          //   BoxShadow(color: Colors.grey, offset: Offset(-1, 0)),
          //   BoxShadow(color: Colors.grey, offset: Offset(0, -1))
          // ],
        ),
        child: Icon(
          icon,
          color: Colors.white70,
          size: size,
        ),
      ),
    );
  }
}
