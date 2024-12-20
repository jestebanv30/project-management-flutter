import 'package:flutter/material.dart';
import 'package:project_management/feature/auth/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginBody(),
      ),
    );
  }
}
