import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/login_controller.dart';
import 'package:project_management/core/controller/register_controller.dart';
import 'package:project_management/core/utils/app_color.dart';
import 'package:project_management/feature/auth/widgets/textfield_sufix.dart';
import 'package:project_management/routes.dart';

class TextInputField extends StatefulWidget {
  final bool focus;
  final String hint;
  final TextEditingController controller;
  final VoidCallback onTap;
  final ValueChanged<String>? onChange;
  final VoidCallback? showPassword;
  final bool? hideText;
  final bool? correct;

  const TextInputField(
      {super.key,
      required this.focus,
      required this.hint,
      required this.controller,
      required this.onTap,
      this.onChange,
      this.showPassword,
      this.hideText,
      this.correct});

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showEyeIcon = false; // Controla si el ícono debe mostrarse

  final _registerController = Get.put(RegisterController());
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: widget.focus
            ? const LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent])
            : null,
      ),
      child: TextFormField(
        controller: widget.controller,
        onTap: widget.onTap,
        onTapOutside: (event) {
          if (Get.currentRoute == AppRoutes.register) {
            _registerController.onTapOutside(context);
          } else if (Get.currentRoute == AppRoutes.login) {
            _loginController.onTapOutside(context);
          }
        },
        onChanged: (value) {
          setState(() {
            showEyeIcon = value.isNotEmpty;
          });

          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        obscureText: widget.hideText ?? true,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          suffixIcon: widget.hint == 'you@example.com' ||
                  widget.hint == 'Introduce tu nombre'
              ? (widget.correct == true && widget.controller.text.isNotEmpty)
                  ? const TextfieldSufix(icon: Icons.done)
                  : null
              : widget.hint == 'Introduce tu contraseña' ||
                      widget.hint == 'Elija una contraseña segura'
                  ? (showEyeIcon // Muestra el ícono solo si el usuario ha escrito algo
                      ? GestureDetector(
                          onTap: widget.showPassword,
                          child: widget.hideText!
                              ? const TextfieldSufix(
                                  icon: FontAwesomeIcons.eyeLowVision,
                                  size: 13,
                                )
                              : const TextfieldSufix(
                                  icon: FontAwesomeIcons.eye,
                                  size: 13,
                                ),
                        )
                      : const SizedBox())
                  : const SizedBox(),
          fillColor: primaryColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hoverColor: Colors.pinkAccent,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ),
    );
  }
}
