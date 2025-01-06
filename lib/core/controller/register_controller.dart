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
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  final email = TextEditingController().obs;
  final name = TextEditingController().obs;
  final password = TextEditingController().obs;

  void validateEmail() {
    correctEmail.value = Utils.validateEmail(email.value.text.toString());
  }

  void validateName() {
    correctName.value = name.value.text.toString().length > 5;
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void createAccount() {
    if (!correctName.value) {
      Utils.showSnackBar(
          'Advertencia',
          'Ingresa el nombre correctamente',
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.pink,
          ));
      return;
    }
    if (!correctEmail.value) {
      Utils.showSnackBar(
          'Advertencia',
          'Ingresa el correo correctamente',
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
    AuthFirebaseService.createAccount();
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
