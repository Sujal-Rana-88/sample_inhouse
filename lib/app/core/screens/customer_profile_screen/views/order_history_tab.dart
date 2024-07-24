import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../constants/style_constants.dart';
import '../controller/customer_profile_screen_controller.dart';

class OrderHistoryTab extends StatefulWidget {
  const OrderHistoryTab({super.key});

  @override
  State<OrderHistoryTab> createState() => _OrderHistoryTabState();
}

class _OrderHistoryTabState extends State<OrderHistoryTab> {
  final CustomerProfileScreenController customerProfileScreenController = Get.find<CustomerProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: customerProfileScreenController.userOrders.length,
        itemBuilder: (context, index) {
          final order = customerProfileScreenController.userOrders[index];
          final timestamp = order['timestamp'] as Timestamp;
          final dateTime = timestamp.toDate();
          final formattedDate = DateFormat('EEE, yyyy-MM-dd').format(dateTime);
          final formattedTime = DateFormat('hh:mm a').format(dateTime);

          return Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28, bottom: 34),
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
                  ListTile(
                    title: Column(
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
                              style: StyleConstants.green_colorTextstyle15w500,
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
                  const Divider(
                    color: Color(0xFFEBEBEB),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '${order['unit']} units of ${order['productType']}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(order['product']),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 10, left: 10),
                          child: Row(
                            children: [
                              Text(
                                "$formattedDate at $formattedTime",
                                style: StyleConstants.blackTextStyle14w400,
                              ),
                              const Spacer(),
                              GestureDetector(
                                child: const Row(
                                  children: [
                                    Text('View Details'),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 12,
                                    ),
                                  ],
                                ),
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
          );
        },
      );
    });
  }
}

