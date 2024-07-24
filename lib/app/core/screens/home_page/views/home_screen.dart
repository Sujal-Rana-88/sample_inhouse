import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/routes/app_pages.dart';
import 'package:sample_inhouse/app/core/screens/home_page/controllers/home_screen_controller.dart';

import '../../../constants/style_constants.dart';
import 'bottom_navigation_bar.dart';

class HomeScreen extends GetView<HomeScreenController> {
  final homeController = Get.find<HomeScreenController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Home Screen", style: StyleConstants.black20w700,),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text("hello"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PAGE);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        elevation: 6.0,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        onMenuTap: () => Get.toNamed(Routes.HOME),
        onSearchTap: () => Get.toNamed(Routes.CUSTOMERS_SCREEN),
        onPrintTap: () => Get.toNamed(Routes.ADD_PAGE),
        onPeopleTap: () => Get.toNamed(Routes.CUSTOMERS_SCREEN),
      ),
    );
  }
}
