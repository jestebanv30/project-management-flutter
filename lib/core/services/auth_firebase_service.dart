import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/login_controller.dart';
import 'package:project_management/core/controller/register_controller.dart';
import 'package:project_management/core/models/shared_preferences.dart';
import 'package:project_management/core/utils/utiils.dart';

class AuthFirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static final loginController = Get.put(LoginController());
  static final registerController = Get.put(RegisterController());

  static Future<void> createAccount() async {
    try {
      registerController.setLoading(true);
      final String str = registerController.email.value.text.toString();
      final String node = str.substring(0, str.indexOf('@'));
      database.ref('Accounts').child(node).set({
        'name': registerController.name.value.text.toString(),
        'email': registerController.email.value.text.toString(),
        'password': registerController.password.value.text.toString(),
      }).then((value) {
        auth
            .createUserWithEmailAndPassword(
                email: registerController.email.value.text.toString(),
                password: registerController.password.value.toString())
            .then((value) {
          UserPref.setUser(
              registerController.name.value.text.toString(),
              registerController.email.value.text.toString(),
              registerController.password.value.text.toString(),
              node,
              value.user!.uid.toString());
          Utils.showSnackBar(
              'Registrarse',
              'Cuenta creada existosamente',
              const Icon(
                Icons.done,
                color: Colors.white,
              ));
          registerController.setLoading(false);
        }).onError((error, stackTrace) {
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(
                FontAwesomeIcons.triangleExclamation,
                color: Colors.red,
              ));
          registerController.setLoading(false);
        });
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        registerController.setLoading(false);
      });
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
      registerController.setLoading(false);
    }
  }
}
