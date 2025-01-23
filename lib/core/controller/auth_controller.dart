import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_management/core/services/auth_firebase_service.dart';
import 'package:project_management/core/utils/utiils.dart';
import 'package:project_management/routes.dart';

class AuthController extends GetxController {
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

  final AuthFirebaseService authFirebaseService = AuthFirebaseService();
  final storage = GetStorage();

  var userObservable = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    autoLogin();
  }

  void validateEmail(String value) {
    correctEmail.value = Utils.validateEmail(value);
  }

  void validateName(String value) {
    // Validar que el nombre tenga al menos 4 caracteres y solo letras (incluyendo espacios)
    final nameRegex = RegExp(r'^[a-zA-Z\s]{4,}$');
    correctName.value = nameRegex.hasMatch(value);
  }

  bool isPasswordValid(String value) {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,32}$',
    );
    return passwordRegex.hasMatch(value);
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  bool validateFields(String email, String password, String name) {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      Utils.showSnackBar(
        'Advertencia',
        'Por favor, completa todos los campos.',
        const Icon(Icons.warning, color: Colors.red),
      );
      return false;
    }
    validateName(name);
    if (!correctName.value) {
      Utils.showSnackBar(
        'Advertencia',
        'El nombre debe tener al menos 4 caracteres.',
        const Icon(FontAwesomeIcons.triangleExclamation, color: Colors.pink),
      );
      return false;
    }
    if (!correctEmail.value) {
      Utils.showSnackBar(
        'Advertencia',
        'Ingresa un correo válido.',
        const Icon(FontAwesomeIcons.triangleExclamation, color: Colors.pink),
      );
      return false;
    }
    // if (!isPasswordValid(password)) {
    //   Utils.showSnackBar(
    //     'Advertencia',
    //     'La contraseña debe tener entre 6 y 32 caracteres.',
    //     const Icon(Icons.warning, color: Colors.red),
    //   );
    //   return false;
    // }
    if (password.length < 6 || password.length > 32) {
      Utils.showSnackBar(
          'Advertencia',
          'La longitud de la contraseña debe ser mayor o igual a 6 caracteres.',
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.pink,
          ));
      return false;
    }
    return true;
  }

  Future<void> createAccount(String email, String password, String name) async {
    try {
      if (!validateFields(email, password, name)) return;

      setLoading(true);

      User? user =
          await authFirebaseService.createAccount(email, password, name);

      if (user != null) {
        userObservable.value = user;
        await saveCredentials(email, password);
        Utils.showSnackBar('Éxito', 'Cuenta creada exitosamente.',
            const Icon(Icons.done, color: Colors.white));
        Get.offAllNamed(AppRoutes.home);
        clearFieldRegister();
      } else {
        Utils.showSnackBar('Error', 'No se pudo registrar el usuario.',
            const Icon(Icons.error, color: Colors.red));
      }
    } catch (e) {
      Utils.showSnackBar('Error', Utils.extractFirebaseError(e.toString()),
          const Icon(Icons.error, color: Colors.red));
    } finally {
      setLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      if (!validateFields(email, password, "name")) return;

      setLoading(true);

      User? user = await authFirebaseService.loginWithEmail(email, password);
      if (user != null) {
        userObservable.value = user;
        await saveCredentials(email, password);
        Get.offAllNamed(AppRoutes.home);
        clearFieldRegister();
      } else {
        Utils.showSnackBar('Error', 'No se iniciar sesión.',
            const Icon(Icons.error, color: Colors.red));
      }
    } catch (e) {
      Utils.showSnackBar('Error', Utils.extractFirebaseError(e.toString()),
          const Icon(Icons.error, color: Colors.red));
    } finally {
      setLoading(false);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      setLoading(true);

      User? user = await authFirebaseService.loginWithGoogle();

      if (user != null) {
        userObservable.value = user;
        Utils.showSnackBar(
            'Éxito',
            'Inicio de sesión exitoso.',
            const Icon(
              Icons.done,
              color: Colors.white,
            ));
        Get.offAllNamed(AppRoutes.home);
      } else {
        Utils.showSnackBar(
            'Advertencia',
            'Inicio de sesión cancelado.',
            const Icon(
              Icons.warning,
              color: Colors.red,
            ));
      }
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            Icons.error,
            color: Colors.red,
          ));
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    await authFirebaseService.signOut();
    await clearCredentials();
    userObservable.value = null;
    Get.offAllNamed(AppRoutes.login);
    Utils.showSnackBar(
        'Sesión cerrada',
        'Hasta pronto',
        const Icon(
          Icons.done,
          color: Colors.white,
        ));
  }

  Future<void> autoLogin() async {
    String? email = storage.read('email');
    String? password = storage.read('password');

    if (email != null && password != null) {
      await login(email, password);
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    storage.write('email', email);
    storage.write('password', password);
  }

  Future<void> clearCredentials() async {
    storage.remove('email');
    storage.remove('password');
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
