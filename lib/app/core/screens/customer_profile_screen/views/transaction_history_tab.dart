import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/style_constants.dart';
import '../controller/customer_profile_screen_controller.dart';

class TransactionHistoryTab extends StatefulWidget {
  const TransactionHistoryTab({super.key});

  @override
  State<TransactionHistoryTab> createState() => _TransactionHistoryTabState();
}

class _TransactionHistoryTabState extends State<TransactionHistoryTab> {
  final CustomerProfileScreenController customerProfileScreenController =
      Get.find<CustomerProfileScreenController>();

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
                              'March 7, 2022 12:14 PM',
                              style: StyleConstants.balcktextstyle400,
                            ),
                            const Spacer(),
                            Text(
                              ' ₹33.65',
                              style: StyleConstants.headingTextstyleskyblue2,
                            ),
                          ],
                        ),
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
