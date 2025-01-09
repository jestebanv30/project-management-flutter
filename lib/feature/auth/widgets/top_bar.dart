import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/feature/widgets/back_buttom_global.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String? routeName;

  const TopBar({super.key, required this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtom(
          onTap: () {
            if (routeName != null && routeName!.isNotEmpty) {
              Get.toNamed(routeName!);
            } else {
              Get.back();
            }
          },
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
