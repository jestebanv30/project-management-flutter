import 'package:flutter/material.dart';
import 'package:project_management/core/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Configuración')),
        body: Center(
          child: SwitchListTile(
            title: const Text('Modo oscuro'),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        )
        //body: SafeArea(
        //  child: LoginBody(),
        //),
        );
  }
}
