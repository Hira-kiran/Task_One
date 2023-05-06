import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/auth/signup_screen.dart';
import 'package:task_one/components/textformfield.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';
import '../components/reusable_button.dart';
import '../provider/login_provider.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        "Welcome Back",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.interFont),
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
                        child: Text(
                          "Don’t have an account?",
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
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: const Text(
                            "Sign Up",
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
