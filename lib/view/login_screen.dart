import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/components/reusableTextWidget.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';
import '../components/reusable_button.dart';
import '../provider/login_provider.dart';
import '../utils/utils.dart';
import '../widgets/textformfield.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
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
                        text: "Welcome Back",
                        textAlign: TextAlign.start,
                        textClr: AppColors.whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      20.ph,
                      Form(
                        key: loginProvider.formKey,
                        child: Column(
                          children: [
                            TextFormFieldW(
                              controller: userNameController,
                              hintText: "Username",
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            20.ph,
                            TextFormFieldW(
                              controller: passwordcontroller,
                              hintText: "Password",
                              obscure: true,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.ph,
                      Consumer<LoginProvider>(builder: (context, value, child) {
                        return ReusableButton(
                          text: "Sign In",
                          loading: value.loading,
                          onclick: () {
                            value.setLoading(true);
                            value.signIn(userNameController.value.text,
                                passwordcontroller.value.text, context);
                          },
                          color: AppColors.whiteColor,
                        );
                      }),
                      70.ph,
                      Center(
                          child: ReusableTextW(
                              text: "Don’t have an account?",
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
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                            child: ReusableTextW(
                                text: "Sign Up",
                                textClr: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
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
