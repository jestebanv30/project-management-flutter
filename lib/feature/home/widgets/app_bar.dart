import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).primaryColor,
      leading: const Icon(Icons.menu),
      actions: [
        InkWell(
          onTap: () => Get.toNamed(AppRoutes.profile),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpeg"),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
