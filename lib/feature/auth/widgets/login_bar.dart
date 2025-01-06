import 'package:flutter/material.dart';

class LoginBar extends StatelessWidget {
  const LoginBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BackButton(),
        SizedBox(
          width: 20,
        ),
        Text(
          'Iniciar Sesión',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
