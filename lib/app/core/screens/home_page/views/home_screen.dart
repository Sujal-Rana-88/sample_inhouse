import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/views/customers_screen.dart';
import 'package:sample_inhouse/app/core/screens/home_page/controllers/home_screen_controller.dart';
import 'package:sample_inhouse/app/core/screens/home_page/views/home_screen_order_info.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icon.dart';
import '../../../routes/app_pages.dart';

import 'date_picker.dart';

class HomeScreen extends GetView<HomeScreenController> {
  final homeController = Get.find<HomeScreenController>();

  HomeScreen({super.key});

  final pages = [
    Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Row(
          children: [Text('HomeScreen'), Spacer(), DatePicker()],
        )),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenOrderInfo(),
            ],
          ),
        ),
      ),
    ),
    CustomersScreen(),
    CustomersScreen(),
    CustomersScreen(),
    CustomersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (homeController) {
      return Scaffold(
        body: Obx(
          () => pages[homeController.pageIndex.value],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_PAGE);
          },
          child: const Icon(Icons.add),
          backgroundColor: CustomColor.orange_bold_color,
          elevation: 6.0,
          shape: const CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: buildMyNavBar(context),
        ),
      );
    });
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: CustomColor.white,
        border: Border(
          top: BorderSide(color: CustomColor.textfieldcolor, width: 1),
        ),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(context, 0, AppIcon.homeIcon),
              buildNavItem(context, 1, AppIcon.personIcon),
              const SizedBox(width: 40),
              buildNavItem(context, 2, AppIcon.scooterIcon),
              buildNavItem(context, 3, AppIcon.scooterIcon),
            ],
          )),
    );
  }

  InkWell buildNavItem(BuildContext context, int index, String iconPath) {
    return InkWell(
      onTap: () {
        homeController.pageIndex.value = index;
      },
      child: homeController.pageIndex.value == index
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: CustomColor.orange_bold_color,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(8.0),
                      bottomStart: Radius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                SvgPicture.asset(iconPath),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset(iconPath),
              ],
            ),
    );
  }
}
