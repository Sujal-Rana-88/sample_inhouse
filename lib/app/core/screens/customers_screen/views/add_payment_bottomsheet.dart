import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sample_inhouse/app/core/constants/app_icon.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';

import '../controllers/customers_screen_controller.dart';

class AddPaymentBottomsheet extends StatelessWidget {
   AddPaymentBottomsheet({super.key});
  final CustomersScreenController customersScreenController =
  Get.find<CustomersScreenController>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.03),
            child: Row(
              children: [
                Text(
                  'Pament',
                  style: StyleConstants.normalblacktextstyle700,
                ),
                Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AppIcon.BackCrossIcon))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Row(
              children: [
                Text(
                  'Money Received',
                  style: StyleConstants.textcolor114w400,
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'Receiver Name',
                style: StyleConstants.blacktextcolor16w400,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: customersScreenController.userNameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabled: false,
                    hintText: "User Name",
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
              SizedBox(width: screenWidth*0.05,),
              SvgPicture.asset(AppIcon.contactIcon)
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: screenHeight*0.02),
            child: Row(
              children: [
                Text(
                  'Receiver Mobile Number',
                  style: StyleConstants.blacktextcolor16w400,
                )
              ],
            ),
          ),
          TextField(
            // controller: editProfileScreenController.userNameController,
            style: TextStyle(color: Colors.black),
            controller: customersScreenController.userPhoneNumberController,
            decoration: InputDecoration(

              hintText: "Enter mobile no",
              //TODO: update this according to user name
              hintStyle: TextStyle(color: Colors.grey),
              enabled: false,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              counterText: "", // Hide the counter text
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: screenWidth*0.03),
            child: Row(
              children: [
                Text(
                  'Amount Received',
                  style: StyleConstants.blacktextcolor16w400,
                )
              ],
            ),
          ),
          TextField(
            controller: customersScreenController.userAmountReceived,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter received amount",
              //TODO: update this according to user name
              hintStyle: TextStyle(color: Colors.grey),

              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFEAEBEE), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              counterText: "", // Hide the counter text
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          GestureDetector(
            onTap: (){
              customersScreenController.addPayment(customersScreenController.userPhoneNumberController.text.toString());
              Navigator.pop(context);
              // customersScreenController.refreshData();
              customersScreenController.userAmountReceived.clear();
            },

            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFA713F),
              child: SizedBox(
                width: screenHeight*2.03,
                height: screenHeight*0.06,
                child: Center(
                  child: Text(
                    'Save',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
