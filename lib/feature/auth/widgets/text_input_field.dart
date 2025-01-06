import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/login_controller.dart';
import 'package:project_management/core/controller/register_controller.dart';
import 'package:project_management/core/utils/app_color.dart';
import 'package:project_management/feature/auth/widgets/textfield_sufix.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {super.key,
      required this.focus,
      required this.hint,
      required this.controller,
      required this.onTap,
      required this.onChange,
      this.showPassword,
      this.hideText,
      this.correct});

  final bool focus;
  final String hint;
  final TextEditingController controller;
  final VoidCallback onTap;
  final VoidCallback onChange;
  final VoidCallback? showPassword;
  final bool? hideText;
  final bool? correct;
  final _registerController = Get.put(RegisterController());
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: focus
            ? const LinearGradient(colors: [Colors.purpleAccent, Colors.pink])
            : null,
      ),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        onTapOutside: (event) {
          _registerController.onTapOutside(context);
          _loginController.onTapOutside(context);
        },
        onChanged: (value) {
          onChange();
        },
        obscureText: hideText ?? false,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          suffixIcon: hideText == null
              ? correct == true
                  ? const TextfieldSufix(icon: Icons.done)
                  : null
              : _registerController.password.value.text.toString().isNotEmpty
                  ? GestureDetector(
                      onTap: showPassword,
                      child: hideText!
                          ? const TextfieldSufix(
                              icon: FontAwesomeIcons.eye,
                              size: 13,
                            )
                          : const TextfieldSufix(
                              icon: FontAwesomeIcons.eyeLowVision,
                              size: 13,
                            ),
                    )
                  : const SizedBox(),
          fillColor: primaryColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hoverColor: Colors.pinkAccent,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ),
    );
  }
}
