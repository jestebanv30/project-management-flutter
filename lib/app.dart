import 'package:flutter/material.dart';
import 'package:project_management/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tema de la app
      theme: ThemeData(
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
      debugShowCheckedModeBanner: false,
      // Ruta inicial de la app
      initialRoute: AppRoutes.home,
      // Generador de rutas centralizado
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
