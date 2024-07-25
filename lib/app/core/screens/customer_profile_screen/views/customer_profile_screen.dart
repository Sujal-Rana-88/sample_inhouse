import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/customer_profile_screen/views/customer_profile_view.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icon.dart';
import '../../../routes/app_pages.dart';
import '../controller/customer_profile_screen_controller.dart';

class CustomerProfileScreen extends GetView<CustomerProfileScreenController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcon.backIcon,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Text(
              'Customer Profile',
              style: StyleConstants.black20w700,
            ),
            const Spacer(),
             GestureDetector(
               onTap: (){
                 Get.toNamed(
                   Routes.EDIT_PORFILE_SCREEN,
                 );
               },
               child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.lightblue,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColor.lightblue,
                ),
                           ),
             ),
          ],
        ),
      ),
      body: CustomerProfileView(),
    );
  }
}