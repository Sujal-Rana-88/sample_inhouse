import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/controllers/customers_screen_controller.dart';

import '../../../routes/app_pages.dart';

class GetCustomersInfo extends StatefulWidget {
  const GetCustomersInfo({Key? key}) : super(key: key);

  @override
  State<GetCustomersInfo> createState() => _GetCustomersInfoState();
}

class _GetCustomersInfoState extends State<GetCustomersInfo> {
  var searchController = TextEditingController();
  final CustomersScreenController customersScreenController = Get.find<CustomersScreenController>();

  @override
  Widget build(BuildContext context) {
    // Check if pagingController is properly initialized
    final pagingController = customersScreenController.pagingController;

    if (pagingController == null) {
      return Center(child: Text('Paging controller is not initialized'));
    }

    return Column(
      children: [
        // TextField(
        //   controller: searchController,
        //   decoration: const InputDecoration(
        //     labelText: 'Search Customer',
        //     prefixIcon: Icon(Icons.search),
        //   ),
        // ),
        Expanded(
          child: PagedListView<int, DocumentSnapshot>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<DocumentSnapshot>(
              itemBuilder: (context, data, index) {
                // Ensure data fields are not null and have default values if they are
                final name = data['name'] as String? ?? '';
                final address = data['Address'] as String? ?? '';
                final phoneNumber = data['phoneNumber'] as String? ?? '';
                final currentBalance = data['amountLeft'] as String? ?? '';

                return ListTile(
                  title: Text(name),
                  subtitle: Text(address),
                  onTap: () {
                    // setState(() {
                    //   searchController.text = name;
                    // });
                    // Ensure that arguments are not null
                    Get.toNamed(
                      Routes.CUSTOMER_PROFILE_SCREEN,
                      arguments: [
                        phoneNumber,
                        name,
                        address,
                        currentBalance,
                      ],
                    );
                  },
                );
              },

              firstPageErrorIndicatorBuilder: (context) =>
                  Center(child: Text("Error: ${pagingController.error}")),
              noItemsFoundIndicatorBuilder: (context) => Center(child: Text("No items found")),
            ),
          ),
        ),
      ],
    );
  }
}
