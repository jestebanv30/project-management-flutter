import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/auth_controller.dart';
import 'package:project_management/feature/auth/widgets/account_buttom.dart';
import 'package:project_management/feature/auth/widgets/auth_form.dart';
import 'package:project_management/feature/auth/widgets/register_options.dart';
import 'package:project_management/feature/auth/widgets/top_bar.dart';
import 'package:project_management/routes.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const TopBar(
                  title: "Iniciar sesión",
                  routeName: AppRoutes.welcome,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Inicia sesión con algunas de las siguientes opciones.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const RegisterOptions(),
                AuthForm(
                  fields: [
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
                      hint: 'Introduce tu contraseña',
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
                    text: "Iniciar sesión",
                    loading: authController.loading.value,
                    onTap: () {
                      String email = authController.emailController.text.trim();
                      String password =
                          authController.passwordController.text.trim();
                      authController.login(email, password);
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      authController.clearFieldRegister();
                      Get.toNamed(AppRoutes.register);
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: '¿No tienes cuenta? ',
                            style: TextStyle(color: Colors.grey)),
                        TextSpan(
                            text: ' Regístrate',
                            style: TextStyle(color: Colors.blue)),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
