import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/login_controller.dart';
import 'package:project_management/feature/auth/widgets/text_input_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          '  Email',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => TextInputField(
            focus: loginController.emailFocus.value,
            hint: "localhost@gmail.com",
            controller: loginController.email.value,
            onTap: () => loginController.onFocusEmail(),
            correct: loginController.correctEmail.value,
            onChange: loginController.validateEmail,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '  Password',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => TextInputField(
            focus: loginController.passwordFocus.value,
            hint: "Elije una contraseña segura",
            controller: loginController.password.value,
            onTap: () => loginController.onFocusPassword(),
            hideText: loginController.showPassword.value,
            onChange: () {},
            showPassword: () => loginController.showPassword.toggle(),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
