import 'package:flutter/material.dart';
import 'package:task_one/auth/signup_screen.dart';
import 'package:task_one/view/home_screen.dart';

import 'widgets/bottom_Nav_Bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task # 1',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationW(),
    );
  }
}
