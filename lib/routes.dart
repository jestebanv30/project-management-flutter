import 'package:get/get.dart';
import 'package:project_management/feature/auth/pages/login_screen.dart';
import 'package:project_management/feature/auth/pages/register_screen.dart';
import 'package:project_management/feature/home/pages/home_screen.dart';
import 'package:project_management/feature/home/pages/profile_screen.dart';
import 'package:project_management/feature/projects/pages/post_detail_screen.dart';
import 'package:project_management/feature/projects/pages/post_screen.dart';
import 'package:project_management/feature/welcome/pages/welcome_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String posts = '/posts';
  static const String postDetail = '/post_detail';
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';

  static final routes = [
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: posts, page: () => const PostsScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
      name: postDetail,
      page: () => PostDetailScreen(
        post: Get.arguments['post'],
        index: Get.arguments['index'],
      ),
    ),
  ];
}
