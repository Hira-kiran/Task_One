import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_one/components/reusableTextWidget.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';
import 'package:task_one/constant/images.dart';
import '../utils/utils.dart';
import 'signup_screen.dart';

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
    // 'Home Decor'
  ];
  List<String> imgs = [
    AppImages.shoesImg,
    AppImages.bagImg,
    AppImages.cloth,
    AppImages.entertainment,
    AppImages.jewlery,
    AppImages.food,
    AppImages.book,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*   appBar: AppBar(
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
      ), */
        body: Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                230.ph,
                Container(
                  width: double.infinity,
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
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 30,
                                color: isExpanded
                                    ? AppColors.greyColor
                                    : AppColors.blackColor,
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
                      children: List.generate(
                          items.length,
                          (index) => InkWell(
                                onTap: () {
                                  isExpanded = true;
                                  selectedValue = items[index];
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 52,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selectedValue == items[index]
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
                                              text: items[index].toString(),
                                              textClr:
                                                  selectedValue == items[index]
                                                      ? AppColors.whiteColor
                                                      : AppColors.blackColor,
                                              fontSize: 16,
                                            ),
                                            Image.asset(imgs[index].toString()),
                                          ],
                                        ),
                                      )),
                                ),
                              ))),
              ]),
            ),
          ),
        ),
        Container(
          height: 130,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.blackColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 140),
                child: Text(
                  "Gift Folder",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontFamily: AppFonts.interFont,
                      fontWeight: FontWeight.w700),
                ),
              ),
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
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.whiteColor,
                  ))
            ],
          ),
        ),
        Positioned(
          top: 110,
          left: 16,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
        )
      ],
    ));
  }
}





//  SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             children: [
//               15.ph,
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     children: [
//                       Image.asset(AppImages.shoes),
//                       15.pw,
//                       Image.asset(AppImages.bag),
//                       15.pw,
//                       Image.asset(AppImages.dress),
//                       15.pw,
//                       Image.asset(AppImages.shoes),
//                     ],
//                   ),
//                 ),
//               ),
//               30.ph,
            
//             ],
//           ),
//         ),
//       ),


