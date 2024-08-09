import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/add_page/controllers/add_page_controller.dart';
import 'package:sample_inhouse/app/core/screens/add_page/views/products_dropdown.dart';
import 'product_type_drop_down.dart';

class AddNewItemsBottomsheet extends StatefulWidget {
  const AddNewItemsBottomsheet({super.key});

  @override
  State<AddNewItemsBottomsheet> createState() => _AddNewItemsBottomsheetState();
}

class _AddNewItemsBottomsheetState extends State<AddNewItemsBottomsheet> {
  AddPageController addPageController = Get.find<AddPageController>();
  String selectedProductType = 'Bricks';
  String selectedProduct = 'Normal';
  String selectUnit = '';

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        initialChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        "Enter Product Details",
                        style: StyleConstants.headingTextstyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Product Type",
                            style: StyleConstants.normalblacktextstyle700,
                          ),
                          const Spacer(),
                          ProductTypeDropDown(
                            onChanged: (value) {
                              setState(() {
                                selectedProductType = value as String;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(

                        children: [
                          Text(
                            "Product",
                            style: StyleConstants.normalblacktextstyle700,
                          ),
                          const Spacer(),
                          ProductsDropdown(
                            onChanged: (value) {
                              setState(() {
                                selectedProduct = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Unit",
                            style: StyleConstants.normalblacktextstyle700,
                          ),
                          const Spacer(),
                          Container(
                            width: 120,
                            height: 80,
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: addPageController.unitController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                counterText: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Cost",
                            style: StyleConstants.normalblacktextstyle700,
                          ),
                          const Spacer(),
                          Container(
                            width: 120,
                            height: 80,
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: addPageController.costController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                counterText: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Amount Received",
                            style: StyleConstants.normalblacktextstyle700,
                          ),
                          const Spacer(),
                          Container(
                            width: 120,
                            height: 80,
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: addPageController.amountReceived,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                counterText: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        double unit = double.tryParse(
                                addPageController.unitController.text) ??
                            0.0;
                        double price = double.tryParse(
                                addPageController.costController.text) ??
                            0.0;
                        double amountReceived = double.tryParse(
                                addPageController.amountReceived.text) ??
                            0.0;
                        double finalPrice = unit * price;
                        String paymentType = "";
                        if (finalPrice < amountReceived) {
                          paymentType = "credit";
                        } else {
                          paymentType = "cash";
                        }

                        if (addPageController.unitText.isNotEmpty &&
                            addPageController.costText.isNotEmpty &&
                            addPageController.unitText.isNotEmpty &&
                            addPageController.selectedCustomer.value.length ==
                                10) {
                          Map<String, dynamic> orderData = {
                            'timestamp': FieldValue.serverTimestamp(),
                            'customer':
                                addPageController.selectedCustomer.value,
                            'productType': selectedProductType,
                            'product': selectedProduct,
                            'unit': addPageController.unitController.text
                                .toString(),
                            'price': addPageController.amountReceived.text
                                .toString(),
                            'paymentType': paymentType.toString()
                          };
                          addPageController.storeCost();
                          addPageController.userAmount();
                          addPageController.addUserOrderData(orderData);
                          addPageController.unitController.clear();
                          addPageController.amountReceived.clear();
                          addPageController.costController.clear();
                        }
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18, top: 20),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: addPageController.unitText.isNotEmpty &&
                                  addPageController.costText.isNotEmpty &&
                                  addPageController.unitText.isNotEmpty &&
                                  addPageController
                                          .selectedCustomer.value.length ==
                                      10
                              ? const Color(0xFFFA713F)
                              : Colors.grey,
                          child: const SizedBox(
                            width: 400.0,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Order',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
