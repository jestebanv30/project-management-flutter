import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/utils/app_color.dart';

class Utils {
  static bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  static String extractFirebaseError(String error) {
    if (error.contains('email-already-in-use')) {
      return 'El correo ya está registrado. Usa uno diferente.';
    } else if (error.contains('invalid-email')) {
      return 'El correo ingresado no es válido.';
    } else if (error.contains('user-not-found')) {
      return 'Usuario no encontrado. Verifica tu correo.';
    } else if (error.contains('wrong-password')) {
      return 'Contraseña incorrecta. Inténtalo de nuevo.';
    } else if (error.contains('too-many-requests')) {
      return 'Demasiados intentos. Inténtalo más tarde.';
    } else if (error.contains('network-request-failed')) {
      return 'Error de conexión. Verifica tu conexión a internet.';
    } else if (error.contains('internal-error')) {
      return 'Error interno del servidor. Inténtalo más tarde.';
    } else if (error.contains('credential-already-in-use')) {
      return 'La credencial ya está en uso con otra cuenta.';
    } else if (error.contains('auth/invalid-credential')) {
      return 'Las credenciales ingresadas son incorrectas o están mal formadas.';
    } else {
      return "Se produjo un error desconocido. Inténtalo de nuevo.";
      //return error.substring(error.indexOf(']') + 1);
    }
  }

  static void showSnackBar(String title, String message, Widget icon) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: primaryColor,
      title: title,
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
      icon: icon,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      snackStyle: SnackStyle.GROUNDED,
      barBlur: 30,
    ));
  }
}
