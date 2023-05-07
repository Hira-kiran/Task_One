// ignore_for_file: file_names
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_one/widgets/bottom_Nav_Bar.dart';
import '../constant/colors.dart';
import '../constant/fonts.dart';
import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigationW()),
            ((route) => false)),
      );
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
              ((route) => false)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Task One",
          style: TextStyle(
            fontSize: 25,
            fontFamily: AppFonts.interFont,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
