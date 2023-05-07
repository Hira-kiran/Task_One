import 'package:flutter/material.dart';
import 'package:task_one/components/reusableTextWidget.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/images.dart';
import 'package:task_one/utils/utils.dart';
import '../components/reusable_button.dart';
import '../components/rounded_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: _appBar(),
          body: Center(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        ReusableTextW(
                            textAlign: TextAlign.center,
                            textClr: AppColors.greyColor,
                            fontSize: 16,
                            text:
                                "4140 Parker Rd. Allentown, New \n Mexico 31134"),
                        100.ph,
                        ReusableButton(
                          text: "Save",
                          onclick: () {},
                          txtColor: AppColors.whiteColor,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        ReusableTextW(
                            textAlign: TextAlign.center,
                            textClr: AppColors.greyColor,
                            fontSize: 16,
                            text:
                                "4140 Parker Rd. Allentown, New \n Mexico 31134"),
                        100.ph,
                        ReusableButton(
                          text: "Save",
                          onclick: () {},
                          txtColor: AppColors.whiteColor,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

// this is for appbar
  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(500),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              5.ph,
              _interface(),
              _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Expanded(
            child: ReusableTextW(text: "Profile", fontWeight: FontWeight.w700)),
      ],
    );
  }

// this is the ui between the appbar
  Widget _interface() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            15.ph,
            Container(
              height: 82,
              width: 82,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.profileImg),
                      fit: BoxFit.cover)),
            ),
            10.ph,
            ReusableTextW(
              text: "Dianne Russell",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            10.ph,
            ReusableTextW(
                fontSize: 16,
                textClr: AppColors.greyColor,
                text:
                    "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim."),
            40.ph,
            ReusableTextW(
              text: "Birthday",
              fontSize: 16,
            ),
            40.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedBtn(
                  boxBorder: Border.all(color: AppColors.blackColor),
                  text: "23",
                ),
                RoundedBtn(
                  text: "12",
                  color: AppColors.blackColor,
                  txtColor: AppColors.whiteColor,
                ),
                Column(
                  children: [
                    15.ph,
                    RoundedBtn(
                      text: "1993",
                      boxBorder: Border.all(color: AppColors.blackColor),
                    ),
                    4.ph,
                    ReusableTextW(
                      text: "Optional",
                      textClr: AppColors.greyColor,
                      fontSize: 11,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

// ********************* Tabbar *************************
  Widget _tabBar() {
    return TabBar(
      labelColor: AppColors.blackColor,
      indicatorColor: AppColors.blackColor,
      unselectedLabelColor: AppColors.greyColor,
      tabs: const [
        Tab(
          text: 'Address',
        ),
        Tab(
          text: 'Size',
        ),
      ],
    );
  }
}
