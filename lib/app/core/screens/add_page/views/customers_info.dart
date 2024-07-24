import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/controllers/add_page_controller.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/style_constants.dart';
import 'add_new_items_bottomsheet.dart';

class CustomersInfo extends StatefulWidget {
  const CustomersInfo({super.key});

  @override
  State<CustomersInfo> createState() => _CustomersInfoState();
}

class _CustomersInfoState extends State<CustomersInfo> {
  final AddPageController addPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, bottom: 34),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color:const Color(0xFFEAEBEE),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: addPageController.userOrders.length,
                itemBuilder: (context, index) {
                  final order = addPageController.userOrders[index];

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
                                  style:const TextStyle(color: Colors.grey),
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
                                Text(order['productType'] ?? 'Unknown Product'),
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
            }),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('View All',
                      style: StyleConstants.lightblueTextstyle14w500),
                ),
               const Icon(Icons.arrow_drop_down, color: CustomColor.lightblue),
               const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (addPageController.selectedCustomer.value.length ==
                          10) {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const AddNewItemsBottomsheet();
                          },
                        );
                      } else {
                        Get.snackbar("Error", "Choose Your Customer",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    });
                  },
                  child: Text('Add New Items',
                      style: StyleConstants.lightblueTextstyle14w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const AddNewItemsBottomsheet();
                        },
                      );
                    },
                    child:const Icon(Icons.add, color: CustomColor.lightblue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
