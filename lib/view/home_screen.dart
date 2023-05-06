import 'package:flutter/material.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        toolbarHeight: 70,
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: const Text(
          "Gift Folder",
          style: TextStyle(
              fontSize: 20,
              fontFamily: FontAssets.interFont,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset("images/shoes.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset("images/bag.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset("images/dress.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset("images/shoes.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
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
                                child: Text(
                              selectedValue,
                            )),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isExpanded
                                  ? AppColors.greyColor
                                  : AppColors.blackColor,
                            )
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
                            child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: selectedValue == e
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                ),
                                child: Center(
                                    child: Text(
                                  e.toString(),
                                  style: TextStyle(
                                      color: selectedValue == e
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor),

                                  /*  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontSize: 14,
                                          color: selectedValue == e
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor), */
                                ))),
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
