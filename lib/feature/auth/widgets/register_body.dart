import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/auth_controller.dart';
import 'package:project_management/feature/auth/widgets/account_buttom.dart';
import 'package:project_management/feature/auth/widgets/auth_form.dart';
import 'package:project_management/feature/auth/widgets/register_options.dart';
import 'package:project_management/feature/auth/widgets/top_bar.dart';
import 'package:project_management/routes.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const TopBar(
              title: 'Registrarse',
              routeName: AppRoutes.login,
            ),
            const SizedBox(height: 50),
            const Text(
              'Regístrate con una de las siguientes opciones.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const RegisterOptions(),
            AuthForm(
              fields: [
                FormFieldData(
                  label: 'Nombre',
                  hint: 'Introduce tu nombre',
                  focus: authController.nameFocus,
                  controller: authController.nameController,
                  correct: authController.correctName,
                  onTap: authController.onFocusName,
                  onChange: authController.validateName,
                ),
                FormFieldData(
                  label: 'Correo electrónico',
                  hint: 'you@example.com',
                  focus: authController.emailFocus,
                  controller: authController.emailController,
                  correct: authController.correctEmail,
                  onTap: authController.onFocusEmail,
                  onChange: authController.validateEmail,
                ),
                FormFieldData(
                  label: 'Contraseña',
                  hint: 'Elija una contraseña segura',
                  focus: authController.passwordFocus,
                  controller: authController.passwordController,
                  correct: RxBool(true),
                  onTap: authController.onFocusPassword,
                  hideText: authController.showPassword,
                  showPassword: () => authController.showPassword.toggle(),
                ),
              ],
            ),
            Obx(
              () => AccountButtom(
                text: 'Regístrate',
                loading: authController.loading.value,
                onTap: () {
                  String name = authController.nameController.text.trim();
                  String email = authController.emailController.text.trim();
                  String password =
                      authController.passwordController.text.trim();

                  authController.createAccount(email, password, name);
                },
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  authController.clearFieldRegister();
                  Get.back();
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '¿Ya tienes una cuenta? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: ' Inicia sesión',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
