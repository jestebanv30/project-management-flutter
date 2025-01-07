import 'package:flutter/material.dart';
import 'package:project_management/core/utils/app_color.dart';
import 'package:project_management/core/utils/theme_provider.dart';
import 'package:project_management/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: ThemeData(
        // Tema claro (pantallas de home)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xfff2f5fa),
        primaryColorDark: const Color(0xff2758cf),
        primaryColorLight: const Color(0xff3768df),
        primaryColor: const Color(0xffffffff),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2758cf),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        // Tema oscuro (pantallas de auth)
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBackgroundColor,
        primaryColor: primaryColor,
      ),
      themeMode:
          themeProvider.themeMode, // Cambia dinámicamente segun el estado
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
