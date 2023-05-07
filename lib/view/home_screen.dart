import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_one/auth/signup_screen.dart';
import 'package:task_one/components/reusableTextWidget.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';

import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  bool isExpanded = false;
  String selectedValue = 'Categories';
  //list that will be expanded
  List<String> items = [
    'Shoes',
    'Bags',
    'Clothes',
    'Entretainment',
    'Jewelry',
    'Food',
    'Books',
    'Home Decor'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: const Text(
          "Gift Folder",
          style: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.interFont,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // For logout user
                await auth.signOut().then((value) {
                  Utils().toastmsj(
                    "Logout Successfully",
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastmsj(error.toString());
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              15.ph,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset(AppImages.shoes),
                      15.pw,
                      Image.asset(AppImages.bag),
                      15.pw,
                      Image.asset(AppImages.dress),
                      15.pw,
                      Image.asset(AppImages.shoes),
                    ],
                  ),
                ),
              ),
              30.ph,
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5),
                    topRight: const Radius.circular(5),
                    bottomLeft: Radius.circular(isExpanded ? 0 : 5),
                    bottomRight: Radius.circular(isExpanded ? 0 : 5),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          isExpanded = !isExpanded;
                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: ReusableTextW(
                              text: selectedValue,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w700,
                            )),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              size: 30,
                              color: isExpanded
                                  ? AppColors.blackColor
                                  : AppColors.greyColor,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              if (isExpanded)
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: items
                      .map((e) => InkWell(
                            onTap: () {
                              isExpanded = false;
                              selectedValue = e;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 52,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedValue == e
                                        ? Colors.black
                                        : AppColors.lightPink,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableTextW(
                                          text: e.toString(),
                                          textClr: selectedValue == e
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor,
                                          fontSize: 16,
                                        ),
                                        Image.asset(AppImages.shoesImg),
                                      ],
                                    ),
                                  )),
                            ),
                          ))
                      .toList(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
