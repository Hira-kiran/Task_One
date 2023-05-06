import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/auth/login_screen.dart';
import 'package:task_one/components/textformfield.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';
import 'package:task_one/provider/signup_provider.dart';
import 'package:task_one/widgets/bottom_Nav_Bar.dart';
import '../components/reusable_button.dart';
import '../provider/login_provider.dart';
import '../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userNameController = TextEditingController();
  final passwordcontroller = TextEditingController();

  // ******* dispose 3 **********
  @override
  void dispose() {
    userNameController.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 130,
          elevation: 0.0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text(
            "Task1",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: AppFonts.arizonia,
                fontSize: 58,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppImages.kids,
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
                      300.ph,
                      const Text(
                        "Create Account",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.interFont),
                      ),
                      20.ph,
                      Form(
                        key: signupProvider.formKeyy,
                        child: Column(
                          children: [
                            TextFormFieldW(
                              controller: userNameController,
                              hintText: "Username",
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: AppColors.whiteColor,
                              ),
                              onsaved: (value) {
                                userNameController.text = value!;
                                return null;
                              },
                              validator: (value) {
                                RegExp regExp = RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return "Please enter Username";
                                }

                                if (!regExp.hasMatch(value)) {
                                  return "Enter valid Username (3 character)";
                                }

                                return null;
                              },
                            ),
                            20.ph,
                            TextFormFieldW(
                                controller: passwordcontroller,
                                hintText: "Password",
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.whiteColor,
                                ),
                                onsaved: (value) {
                                  passwordcontroller.text = value!;
                                  return null;
                                },
                                validator: (value) {
                                  RegExp regExp = RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return "Please enter your password";
                                  }

                                  if (!regExp.hasMatch(value)) {
                                    return " Enter password password (6 character)";
                                  }

                                  return null;
                                }),
                          ],
                        ),
                      ),
                      20.ph,
                      Consumer<SignupProvider>(
                          builder: (context, value, child) {
                        return ReusableButton(
                          text: "Sign Up",
                          loading: value.loading,
                          onclick: () {
                            value.setLoading(true);
                            value.signUp(userNameController.text,
                                passwordcontroller.text, context);
                          },
                          color: AppColors.whiteColor,
                        );
                      }),
                      70.ph,
                      Center(
                        child: Text(
                          "Already a User?",
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      5.ph,
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
