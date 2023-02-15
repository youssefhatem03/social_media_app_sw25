import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app_sw25/screens/home_screen.dart';
import 'package:social_media_app_sw25/screens/login_screen.dart';
import 'package:social_media_app_sw25/services/firebase_authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (Auth.instance.user == null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            "assets/animations/welcome.json",
          ),
        ),
      ),
    );
  }
}
