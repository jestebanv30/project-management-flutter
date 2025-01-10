import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/register_controller.dart';
import 'package:project_management/feature/auth/widgets/account_buttom.dart';
import 'package:project_management/feature/auth/widgets/auth_form.dart';
import 'package:project_management/feature/auth/widgets/register_options.dart';
import 'package:project_management/feature/auth/widgets/top_bar.dart';
import 'package:project_management/routes.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final registerController = Get.put(RegisterController());

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
                  focus: registerController.nameFocus,
                  controller: registerController.name,
                  correct: registerController.correctName,
                  onTap: registerController.onFocusName,
                  onChange: registerController.validateName,
                ),
                FormFieldData(
                  label: 'Correo electrónico',
                  hint: 'you@example.com',
                  focus: registerController.emailFocus,
                  controller: registerController.email,
                  correct: registerController.correctEmail,
                  onTap: registerController.onFocusEmail,
                  onChange: registerController.validateEmail,
                ),
                FormFieldData(
                  label: 'Contraseña',
                  hint: 'Elija una contraseña segura',
                  focus: registerController.passwordFocus,
                  controller: registerController.password,
                  correct: RxBool(true),
                  onTap: registerController.onFocusPassword,
                  hideText: registerController.showPassword,
                  showPassword: () => registerController.showPassword.toggle(),
                ),
              ],
            ),
            Obx(
              () => AccountButtom(
                text: 'Regístrate',
                loading: registerController.loading.value,
                onTap: () {
                  registerController.clearFieldRegister();
                  registerController.createAccount();
                },
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  registerController.clearFieldRegister();
                  Get.toNamed(AppRoutes.login);
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
