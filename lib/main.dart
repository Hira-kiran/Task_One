import 'package:flutter/material.dart';
import 'package:task_one/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task # 1',
      
      home:LoginScreen(),
    );
  }
}