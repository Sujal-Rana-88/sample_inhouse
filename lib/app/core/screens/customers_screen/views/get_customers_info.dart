import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/controllers/customers_screen_controller.dart';
import '../../../constants/style_constants.dart';
import '../../../routes/app_pages.dart';
import 'add_payment_bottomsheet.dart';

class GetCustomersInfo extends StatefulWidget {
  const GetCustomersInfo({super.key});

  @override
  State<GetCustomersInfo> createState() => _GetCustomersInfoState();
}

class _GetCustomersInfoState extends State<GetCustomersInfo> {
  final searchController = TextEditingController();
  final CustomersScreenController customersScreenController =
      Get.find<CustomersScreenController>();
  bool itemSelected = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final pagingController = customersScreenController.pagingController;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                customersScreenController.updateSearchQuery(value);
                itemSelected = false;
              });
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Enter Customer Name',
              hintStyle: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(Icons.search, color: Colors.black),
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
              counterText: "",
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: searchController.text.isEmpty || itemSelected
                ? FirebaseFirestore.instance.collection('clients').snapshots()
                : FirebaseFirestore.instance
                    .collection('clients')
                    .where('name',
                        isGreaterThanOrEqualTo:
                            searchController.text.trim().toLowerCase())
                    .where('name',
                        isLessThanOrEqualTo:
                            '${searchController.text.trim().toLowerCase()}\uf8ff')
                    .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final data = snapshot.data?.docs ?? [];
              if (data.isEmpty) {
                return Center(child: Text("No items found"));
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final document = data[index];
                  final name = document['name'] as String? ?? '';
                  final address = document['Address'] as String? ?? '';
                  final phoneNumber = document['phoneNumber'] as String? ?? '';

                  return FutureBuilder<Map<String, dynamic>>(
                    future: customersScreenController
                        .fetchWalletDataForCustomer(phoneNumber),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: [],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }

                      final walletData = snapshot.data ?? {};
                      final totalAmountStr =
                          walletData['totalAmount'] as String? ?? '0';
                      final amountLeftStr =
                          walletData['amountLeft'] as String? ?? '0';
                      final totalAmount = double.tryParse(totalAmountStr) ?? 0;
                      final amountLeft = double.tryParse(amountLeftStr) ?? 0;

                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenHeight * 0.02, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFEAEBEE), width: 2.0),
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
                                    arguments: [
                                      phoneNumber,
                                      name,
                                      address,
                                      amountLeftStr
                                    ],
                                  );
                                },
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * 0.02),
                                        child: Container(
                                          width: screenWidth * 0.16,
                                          height: screenHeight * 0.08,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1),
                                          ),
                                          child: const Icon(Icons.person,
                                              size: 20),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.03),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth * 0.08),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                name,
                                                style: StyleConstants.header7,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '+91 $phoneNumber',
                                                style: StyleConstants
                                                    .blacktextcolor16W400,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                address,
                                                style: StyleConstants
                                                    .blacktextcolor16W400,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: screenHeight * 0.01),
                                        child: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: Color(0xFFEBEBEB)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'Total Business: ₹$totalAmount',
                                  style:
                                      StyleConstants.lightbalcktextstyle400_16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  amountLeft > 0
                                      ? 'Amount Pending: ₹$amountLeftStr'
                                      : 'Amount Pending: Nothing',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: amountLeft > 0
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              if (amountLeft > 0)
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.03),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFA4D0EB),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFC9EAF8),
                                              Color(0xFFF6FBFF)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              print("Button Pressed");
                                            },
                                            child: SizedBox(
                                              width: screenWidth * 0.4,
                                              height: screenHeight * 0.06,
                                              child: Center(
                                                child: Text(
                                                  'Transfer Request',
                                                  style: StyleConstants
                                                      .headingTextstyleskyblue2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.05),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFA4D0EB),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFFA713F),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              customersScreenController
                                                  .userNameController
                                                  .text = name;
                                              customersScreenController
                                                  .userPhoneNumberController
                                                  .text = phoneNumber;
                                              showModalBottomSheet<void>(
                                                context: context,
                                                isScrollControlled: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child:
                                                        DraggableScrollableSheet(
                                                      expand: false,
                                                      maxChildSize: 0.9,
                                                      initialChildSize: 0.6,
                                                      builder: (BuildContext
                                                              context,
                                                          ScrollController
                                                              scrollController) {
                                                        return Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16.0),
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16.0),
                                                            ),
                                                            child: ListView(
                                                              controller:
                                                                  scrollController,
                                                              children: [
                                                                Center(
                                                                    child:
                                                                        AddPaymentBottomsheet()),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: SizedBox(
                                              height: screenHeight * 0.06,
                                              width: screenWidth * 0.4,
                                              child: Center(
                                                child: Text(
                                                  'Add Payment',
                                                  style: StyleConstants
                                                      .whiteTextStyle14w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: screenHeight * 0.02),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
