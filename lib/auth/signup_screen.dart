import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_one/auth/login_screen.dart';
import 'package:task_one/components/textformfield.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';

import '../components/reusable_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 130,
          elevation: 0.0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text(
            "Task1",
            style: TextStyle(
                color: AppColors.blackColor,
                fontFamily: FontAssets.arizonia,
                fontSize: 58,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/happyKids.png",
              fit: BoxFit.cover,
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                    stops: const [0.0, 0.1, 0.6],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.whiteColor,
                      AppColors.whiteColor.withOpacity(0.9),
                      AppColors.whiteColor.withOpacity(0.05)
                    ]).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.blackColor, AppColors.blackColor])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontAssets.interFont),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldW(
                        hintText: "Username",
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldW(
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReusableButton(
                        text: "Sign Up",
                        onclick: () {},
                        color: AppColors.whiteColor,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: Text(
                          "Already a User?",
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
