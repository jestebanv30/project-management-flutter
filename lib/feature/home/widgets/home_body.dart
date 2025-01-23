import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/core/controller/auth_controller.dart';
import 'package:project_management/feature/home/pages/profile_screen.dart';
import 'package:project_management/feature/home/widgets/category_selector.dart';
import 'package:project_management/feature/home/widgets/popular_topics.dart';
import 'package:project_management/feature/home/widgets/trending_post.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _currentIndex = 0;

  // Lista de widgets para cada página
  final List<Widget> _pages = [
    const HomeContent(), // Home (contenido inicial)
    const Center(child: Text("Buscador")), // Buscar
    const ProfileScreen(), // Perfil
    const Center(child: Text("Notificaciones")), // Notificaciones (placeholder)
    const Center(child: Text("Mensajes")), // Mensajes (placeholder)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Cambia el contenido según el índice
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Mensajes",
          ),
        ],
      ),
    );
  }
}

// Contenido de la pantalla Home (antes era el contenido de body en tu código)
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).primaryColorLight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: _Heading(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategorySelector(),
                        SizedBox(height: 10),
                        PopularTopics(),
                        SizedBox(height: 10),
                        TrendingPost(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final user = authController.userObservable.value;
                final name = user?.displayName ?? "Usuario";

                return Text(
                  "Hi, $name",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                );
              }),
              Text(
                "Find topics that you like to read",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              authController.signOut();
            }),
      ],
    );
  }
}
