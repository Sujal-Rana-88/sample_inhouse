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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
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
                          selectedProductType = value;
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
                      padding:const  EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addPageController.unitController,

                        keyboardType: TextInputType.number,
                        // maxLength: 10,
                        style:const  TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
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
                      padding:const  EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addPageController.costController,
                        keyboardType: TextInputType.number,
                        // maxLength: 10,
                        style:const  TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
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
                      padding:const  EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addPageController.amountReceived,
                        keyboardType: TextInputType.number,
                        // maxLength: 10,
                        style:const  TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          counterText: "",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // call function here
              GestureDetector(
                onTap: (){
                  if(addPageController.unitText.isNotEmpty && addPageController.costText.isNotEmpty && addPageController.unitText.isNotEmpty && addPageController.selectedCustomer.value.length == 10 ){

                    Map<String, dynamic> orderData = {
                      'timestamp': FieldValue.serverTimestamp(),
                      'customer': addPageController.selectedCustomer.value,
                      'productType': selectedProductType,
                      'product': selectedProduct,
                      'unit': addPageController.unitController.text.toString(),

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
                  padding: const EdgeInsets.only(left: 18.0, right: 18,top: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: addPageController.unitText.isNotEmpty && addPageController.costText.isNotEmpty && addPageController.unitText.isNotEmpty && addPageController.selectedCustomer.value.length == 10  &&  addPageController.selectedCustomer.value.length == 10
                        ? Colors.greenAccent[700]
                        : Colors.grey,
                    child: const SizedBox(
                      width: 400.0,
                      height: 50,
                      child: Center(
                        child:  Text(
                          'Order',
                          style:  TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}