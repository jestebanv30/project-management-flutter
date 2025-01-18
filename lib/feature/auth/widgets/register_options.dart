import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/auth_controller.dart';
import 'package:project_management/feature/auth/widgets/icon_container.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => authController.loginWithGoogle(),
          child: const IconContainer(
            widget: Icon(
              FontAwesomeIcons.google,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        const IconContainer(
          widget: Icon(
            Icons.apple_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
