import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/utils/utiils.dart';

class LoginController extends GetxController {
  RxBool emailFocus = false.obs;
  RxBool passwordFocus = false.obs;
  RxBool correctEmail = false.obs;
  RxBool showPassword = true.obs;
  RxBool loading = false.obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  void loginAccount() {
    if (!correctEmail.value) {
      Utils.showSnackBar(
          'Advertencia',
          'Ingrese el correo electrónico correcto',
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.pink,
          ));
      return;
    }
    if (password.value.text.toString().length < 6) {
      Utils.showSnackBar(
          'Advertencia',
          'La longitud de la contraseña debe ser mayor a 5',
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.pink,
          ));
      return;
    }
    //AuthFirebaseService.loginAccount();
  }

  void clearFieldLogin() {
    email.call().clear();
    password.call().clear();
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void validateEmail(String value) {
    correctEmail.value = Utils.validateEmail(value);
  }

  void onFocusEmail() {
    emailFocus.value = true;
    passwordFocus.value = false;
  }

  void onFocusPassword() {
    emailFocus.value = false;
    passwordFocus.value = true;
  }

  void onTapOutside(BuildContext context) {
    emailFocus.value = false;
    passwordFocus.value = false;
    FocusScope.of(context).unfocus();
  }
}
