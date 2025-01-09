import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_management/core/services/welcome_service.dart';
import 'package:project_management/core/utils/app_color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WelcomeService.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: primaryColor,
              boxShadow: [
                BoxShadow(color: Colors.grey, offset: Offset(1, 1)),
                BoxShadow(color: Colors.grey, offset: Offset(-1, -1))
              ]),
          child: Icon(
            FontAwesomeIcons.candyCane,
            color: Colors.pinkAccent,
            size: 50,
          ),
        ),
      ),
    );
  }
}
