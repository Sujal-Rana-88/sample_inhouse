import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/edit_profile/controllers/edit_profile_screen_controller.dart';
import '../../../constants/app_icon.dart';

class EditProfileScreen extends GetView<EditProfileScreenController>  {
  @override

  Widget build(BuildContext context) {
    final EditProfileScreenController editProfileScreenController = Get.find<EditProfileScreenController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        title:  Row(
          children: [
            Text(
              'Edit  Profile',
              style: StyleConstants.black20w700,
            ),
            Spacer(),
            SvgPicture.asset(
              AppIcon.headphoneIcon,
            ),
          ],
        )
      ),

      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:screenWidth*0.06, bottom: screenHeight*0.01 ),
            child: Row(
              children: [
                Text('Name', style: StyleConstants.black16w500,),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.04, right:  screenWidth*0.04),
            child: TextField(
              controller: editProfileScreenController.userNameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(

                hintText: "User Name", //TODO: update this according to user name
                hintStyle: TextStyle(color: Colors.grey),

                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                counterText: "", // Hide the counter text
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:screenWidth*0.06, bottom: screenHeight*0.01, top: screenHeight*0.04 ),
            child: Row(
              children: [
                Text('Phone Number', style: StyleConstants.black16w500,),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.04, right:  screenWidth*0.04),
            child: TextField(
              controller: editProfileScreenController.userPhoneNumberController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(

                hintText: "Phone Number", //TODO: update this according to user name
                hintStyle: TextStyle(color: Colors.grey),


                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                counterText: "", // Hide the counter text
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:screenWidth*0.06, bottom: screenHeight*0.01, top: screenHeight*0.04 ),
            child: Row(
              children: [
                Expanded(child: Text('Call our Support Team if you want to change business name!', style: TextStyle(
                  color: Colors.red,
                  fontSize: 16
                ),)),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:screenWidth*0.06, bottom: screenHeight*0.01 ),
            child: Row(
              children: [
                Text('Default Address', style: StyleConstants.black16w500,),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.04, right:  screenWidth*0.04),
            child: TextField(

              controller: editProfileScreenController.userAddressController,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Address", //TODO: update this according to user name
                hintStyle: TextStyle(color: Colors.grey),

                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                counterText: "", // Hide the counter text
              ),
            ),
          ),
        ],
      ),
    );
  }
}