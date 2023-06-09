import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/components/reusableTextWidget.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';
import 'package:task_one/provider/signup_provider.dart';
import '../components/reusable_button.dart';
import '../utils/utils.dart';
import '../widgets/textformfield.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userNameController = TextEditingController();
  final passwordcontroller = TextEditingController();

  // ******* dispose **********
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
                color: AppColors.blackColor,
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
                return AppColors.whiteGradient.createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                decoration: BoxDecoration(gradient: AppColors.blackGradient),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    children: [
                      200.ph,
                      ReusableTextW(
                        text: "Create Account",
                        textClr: AppColors.whiteColor,
                        fontSize: 28,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w700,
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
                                obscure: true,
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
                          child: ReusableTextW(
                              text: "Already a User?",
                              textClr: AppColors.greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      5.ph,
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: ReusableTextW(
                              text: "Sign In",
                              textClr: AppColors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      15.ph
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
