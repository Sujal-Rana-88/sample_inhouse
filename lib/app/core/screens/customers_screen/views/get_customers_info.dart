import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/controllers/customers_screen_controller.dart';

import '../../../constants/style_constants.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final pagingController = customersScreenController.pagingController;

    if (pagingController == null) {
      return Center(child: Text('Paging controller is not initialized'));
    }

    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                customersScreenController.updateSearchQuery(searchController.text);
                customersScreenController.updateSearchQuery(value);
              });
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              hintStyle: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(Icons.search, color: Colors.black), // Changed from suffixIcon to prefixIcon
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
              counterText: "",
            ),
          ),
        ),
        Expanded(
          child: PagedListView<int, DocumentSnapshot>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<DocumentSnapshot>(
              itemBuilder: (context, data, index) {
                final name = data['name'] as String? ?? '';
                final address = data['Address'] as String? ?? '';
                final phoneNumber = data['phoneNumber'] as String? ?? '';
                final amountLeftStr = data['amountLeft'] as String? ?? '0';
                final totalAmount = data['totalAmount'] as String? ?? '';

                final amountLeft = double.tryParse(amountLeftStr) ?? 0;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEAEBEE), width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.CUSTOMER_PROFILE_SCREEN,
                              arguments: [phoneNumber, name, address, amountLeftStr],
                            );
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            title: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                                  child: Container(
                                    width: screenWidth * 0.16,
                                    height: screenHeight * 0.08,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFe0f2f1),
                                    ),
                                    child: const Icon(Icons.person, size: 20),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: screenWidth * 0.08),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: StyleConstants.header7,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '+91 $phoneNumber',
                                          style: StyleConstants.blacktextcolor16W400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          address,
                                          style: StyleConstants.blacktextcolor16W400,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: screenHeight * 0.01),
                                  child: Icon(Icons.arrow_forward_ios, size: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(color: Color(0xFFEBEBEB)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Total Business: ₹$totalAmount',
                            style: StyleConstants.lightbalcktextstyle400_16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            amountLeft > 0
                                ? 'Amount Pending: ₹$amountLeftStr'
                                : 'Amount Pending: Nothing',
                            style: TextStyle(
                              fontSize: 16,
                              color: amountLeft > 0 ? Colors.red : Colors.green,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        if (amountLeft > 0)
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.36),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFA4D0EB), width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFC9EAF8), Color(0xFFF6FBFF)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    print("Button Pressed");
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'Transfer Request',
                                        style: StyleConstants.headingTextstyleskyblue2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
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
