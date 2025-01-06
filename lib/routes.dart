import 'package:flutter/material.dart';
import 'package:project_management/feature/auth/pages/login_screen.dart';
import 'package:project_management/feature/auth/pages/signup_screen.dart';
import 'package:project_management/feature/home/pages/home_screen.dart';
import 'package:project_management/feature/home/pages/profile_screen.dart';
import 'package:project_management/feature/projects/pages/post_detail_screen.dart';
import 'package:project_management/feature/projects/pages/post_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String posts = '/posts';
  static const String postDetail = '/post_detail';
  static const String login = '/login';
  static const String signUp = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case posts:
        return MaterialPageRoute(builder: (_) => const PostsScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case postDetail:
        if (settings.arguments is Map) {
          final args = settings.arguments as Map;
          return MaterialPageRoute(
              builder: (_) => PostDetailScreen(
                    post: args['post'],
                    index: args['index'],
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
              body: const Center(
                child: Text("Page not found"),
              ),
            ));
  }
}
