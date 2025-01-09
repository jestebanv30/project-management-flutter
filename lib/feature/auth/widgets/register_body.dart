import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/register_controller.dart';
import 'package:project_management/feature/auth/widgets/top_bar.dart';
import 'package:project_management/routes.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const TopBar(
              title: 'Registrarse',
              routeName: AppRoutes.login,
            ),
            const SizedBox(height: 50),
            const Text('')
          ],
        ),
      ),
    );
  }
}
