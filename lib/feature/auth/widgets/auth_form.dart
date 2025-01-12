import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/feature/auth/widgets/text_input_field.dart';

class AuthForm extends StatelessWidget {
  final List<FormFieldData> fields; // Lista de datos para cada campo
  final VoidCallback? onSubmit; // Accion al enviar el formulario

  const AuthForm({super.key, required this.fields, this.onSubmit});

  //final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        ...fields.map((field) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${field.label}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => TextInputField(
                    focus: field.focus.value,
                    hint: field.hint,
                    controller: field.controller,
                    onTap: field.onTap ?? () {},
                    correct: field.correct.value,
                    onChange: field.onChange ?? (value) {},
                    hideText: field.hideText?.value ?? false,
                    showPassword: field.showPassword,
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 40),
      ],
    );
  }
}

class FormFieldData {
  final String label;
  final String hint;
  final RxBool focus;
  final TextEditingController controller;
  final RxBool correct;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final RxBool? hideText;
  final VoidCallback? showPassword;

  FormFieldData({
    required this.label,
    required this.hint,
    required this.focus,
    required this.controller,
    required this.correct,
    this.onTap,
    this.onChange,
    this.hideText,
    this.showPassword,
  });
}
