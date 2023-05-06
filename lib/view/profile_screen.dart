import 'package:flutter/material.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import '../components/reusable_button.dart';
import '../components/rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "4140 Parker Rd. Allentown, New \n Mexico 31134",
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontAssets.interFont,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ReusableButton(
                        text: "Save",
                        onclick: () {},
                        txtColor: AppColors.whiteColor,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "4140 Parker Rd. Allentown, New \n Mexico 31134",
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontAssets.interFont,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ReusableButton(
                        text: "Save",
                        onclick: () {},
                        txtColor: AppColors.whiteColor,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

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
              const SizedBox(height: 5),
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
      children: const [
        Expanded(
          child: Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _interface() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 82,
              width: 82,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/profile.png"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dianne Russell",
              style: TextStyle(
                  fontFamily: FontAssets.interFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim.",
              style: TextStyle(
                  fontFamily: FontAssets.interFont,
                  fontSize: 16,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Birthday",
              style: TextStyle(
                  fontFamily: FontAssets.interFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    RoundedBtn(
                      text: "1993",
                      boxBorder: Border.all(color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Optional",
                      style: TextStyle(
                          fontFamily: FontAssets.interFont,
                          color: AppColors.greyColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
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
      // labelPadding: const EdgeInsets.all(0),
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
