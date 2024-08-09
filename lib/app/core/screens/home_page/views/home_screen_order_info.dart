import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/home_page/controllers/home_screen_controller.dart';

class HomeScreenOrderInfo extends StatefulWidget {
  const HomeScreenOrderInfo({super.key});

  @override
  State<HomeScreenOrderInfo> createState() => _HomeScreenOrderInfoState();
}

class _HomeScreenOrderInfoState extends State<HomeScreenOrderInfo> {
  final HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.07,
          right: screenWidth * 0.07,
          top: screenHeight * 0.05),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () {
                if (homeScreenController.userOrders.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "No Data Available",
                            style: StyleConstants.blacktextcolor16W600,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeScreenController.userOrders.length,
                  itemBuilder: (context, index) {
                    final order = homeScreenController.userOrders[index];

                    return Column(
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Units: ${order['unit'] ?? 'N/A'}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Product Type:  ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Text(order['productType'] ??
                                      'Unknown Product'),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Product: ',
                                  ),
                                  const Spacer(),
                                  Text(order['product']),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
