import 'dart:async';

import 'package:get/get.dart';
import 'package:project_management/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeService {
  static void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? ui = pref.getString('TOKEN');
    Timer(const Duration(milliseconds: 2000), () {
      if (ui == null) {
        Get.toNamed(AppRoutes.login);
      } else {
        Get.toNamed(AppRoutes.home);
      }
    });
  }
}
