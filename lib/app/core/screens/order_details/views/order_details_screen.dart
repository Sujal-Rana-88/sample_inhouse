import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/order_details/controllers/order_details_screen_controller.dart';
import '../../../constants/app_icon.dart';
import 'package:dotted_line/dotted_line.dart';

class OrderDetailsScreen extends GetView<OrderDetailsScreenController> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Customer Profile',
          style: StyleConstants.black20w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.02,
                  right: screenHeight * 0.02,
                  bottom: 34),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEAEBEE),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Remove padding
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order Number ',
                                    style: StyleConstants.blackTextStyle16600,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Cash',
                                    style:
                                        StyleConstants.green_colorTextstyle15w500,
                                  ),
                                ],
                              ),
                              Text(
                                '3232323',
                                style: StyleConstants.grey_color_variant414w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                right: screenHeight * 0.02,
                                left: screenHeight * 0.02),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcon.scooterIcon,
                                ),
                                Text(
                                  "Two Wheeler Delivery",
                                  style: StyleConstants.blackTextStyle14w400,
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppIcon.deliveredIcon,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.02,
                  right: screenHeight * 0.02,
                  bottom: 34),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEAEBEE),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Remove padding
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcon.buildingIcon,
                                  ),
                                  Text(
                                    'Drop',
                                    style: StyleConstants.blackTextStyle16600,
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(AppIcon.editBlueIcon)
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.all(screenHeight*0.01),
                                child: Text(
                                  'Rajeev chauk new delhi, connaught place delhi-110091',
                                  style: StyleConstants.grey_color_variant414w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(
                color: Color(0xFFEBEBEB),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcon.downloadIcon),
                  SizedBox(width: screenHeight * 0.02),
                  Text(
                    'Get Invoice',
                    style: StyleConstants.blackTextStyle16600,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.02,
                  right: screenHeight * 0.02,
                  bottom: 34),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEAEBEE),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Remove padding
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order Number ',
                                    style: StyleConstants.blackTextStyle16600,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Cash',
                                    style:
                                        StyleConstants.green_colorTextstyle15w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                right: screenHeight * 0.02,
                                left: screenHeight * 0.02),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcon.scooterIcon,
                                ),
                                Text(
                                  "Two Wheeler Delivery",
                                  style: StyleConstants.blackTextStyle14w400,
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppIcon.deliveredIcon,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.02,
                  right: screenHeight * 0.02,
                  bottom: 34),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFEAEBEE),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Remove padding
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order Number ',
                                    style: StyleConstants.blackTextStyle16600,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Cash',
                                    style:
                                        StyleConstants.green_colorTextstyle15w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                right: screenHeight * 0.02,
                                left: screenHeight * 0.02),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Two Wheeler Delivery",
                                      style: StyleConstants.blackTextStyle14w400,
                                    ),
                                    Spacer(),
                                    Text('₹35')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "20 Bags Cement",
                                      style: StyleConstants.blackTextStyle14w400,
                                    ),
                                    Spacer(),
                                    Text('₹35')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "20 Bags Cement",
                                      style: StyleConstants.blackTextStyle14w400,
                                    ),
                                    Spacer(),
                                    Text('₹35'),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.03),
                                  child: DottedLine(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.center,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 4.0,
                                    dashColor: Color(0xFFD6D6D6),
                                    dashRadius: 0.0,
                                    dashGapLength: 4.0,
                                    dashGapColor: Colors.transparent,
                                    dashGapRadius: 0.0,
                                  ),
                                ),
                                SizedBox(height: screenHeight*0.02),
                                Row(
                                  children: [
                                    Text(
                                      "20 Bags Cement",
                                      style: StyleConstants.blackTextStyle14w400,
                                    ),
                                    Spacer(),
                                    Text('₹35'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
