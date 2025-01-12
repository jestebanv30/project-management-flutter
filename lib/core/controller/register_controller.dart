import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/services/auth_firebase_service.dart';
import 'package:project_management/core/utils/utiils.dart';

class RegisterController extends GetxController {
  RxBool nameFocus = false.obs;
  RxBool emailFocus = false.obs;
  RxBool passwordFocus = false.obs;
  RxBool correctEmail = false.obs;
  RxBool correctName = false.obs;
  RxBool showPassword = true.obs;
  RxBool loading = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void validateEmail(String value) {
    correctEmail.value = Utils.validateEmail(value);
  }

  // Ajustar validaciones del name
  void validateName(String value) {
    correctName.value = value.length > 5;
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void createAccount(String name, String email, String password) async {
    // if (!correctName.value) {
    //   Utils.showSnackBar(
    //       'Advertencia',
    //       'Ingresa el nombre correctamente',
    //       const Icon(
    //         FontAwesomeIcons.triangleExclamation,
    //         color: Colors.pink,
    //       ));
    //   print(correctName.value.toString());
    //   return;
    // }
    // if (!correctEmail.value) {
    //   Utils.showSnackBar(
    //       'Advertencia',
    //       'Ingresa el correo correctamente',
    //       const Icon(
    //         FontAwesomeIcons.triangleExclamation,
    //         color: Colors.pink,
    //       ));
    //   return;
    // }
    // if (passwordController.text.trim().length < 5) {
    //   Utils.showSnackBar(
    //       'Advertencia',
    //       'La longitud de la contraseña debe ser mayor a 5',
    //       const Icon(
    //         FontAwesomeIcons.triangleExclamation,
    //         color: Colors.pink,
    //       ));
    //   return;
    // }
    try {
      setLoading(true);

      await AuthFirebaseService().createAccount(email, password, name);

      Utils.showSnackBar('Registrado', 'Cuenta creada exitosamente',
          const Icon(Icons.done, color: Colors.white));

      clearFieldRegister();
    } catch (e) {
      print('Error de Firebase: $e');
      Utils.showSnackBar('Error', Utils.extractFirebaseError(e.toString()),
          const Icon(Icons.error, color: Colors.red));
    } finally {
      setLoading(false);
    }
  }

  void clearFieldRegister() {
    setLoading(false);
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void onFocusEmail() {
    emailFocus.value = true;
    nameFocus.value = false;
    passwordFocus.value = false;
  }

  void onFocusName() {
    emailFocus.value = false;
    nameFocus.value = true;
    passwordFocus.value = false;
  }

  void onFocusPassword() {
    emailFocus.value = false;
    nameFocus.value = false;
    passwordFocus.value = true;
  }

  void onTapOutside(BuildContext context) {
    emailFocus.value = false;
    nameFocus.value = false;
    passwordFocus.value = false;
    FocusScope.of(context).unfocus();
  }
}
