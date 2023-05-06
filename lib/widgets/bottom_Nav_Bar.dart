// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/view/home_screen.dart';
import 'package:task_one/view/profile_screen.dart';

class BottomNavigationW extends StatefulWidget {
  const BottomNavigationW({super.key});

  @override
  State<BottomNavigationW> createState() => _BottomNavigationWState();
}

class _BottomNavigationWState extends State<BottomNavigationW> {
  int index = 0;
  List screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            setState(() {
              index = value;
            });
          }),
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightGreyshade,
          selectedItemColor: AppColors.brown,
          unselectedItemColor: AppColors.blackColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ]),
    );
  }
}
