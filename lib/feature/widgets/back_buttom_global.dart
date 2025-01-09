import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/utils/app_color.dart';

class BackButtom extends StatelessWidget {
  final VoidCallback? onTap;
  const BackButtom({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: darkBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Cambia según necesidad
              offset: const Offset(1, 0),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(-1, 0),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white70,
          size: 18,
        ),
      ),
    );
  }
}
