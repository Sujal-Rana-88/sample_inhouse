import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/views/add_existing_customer.dart';
import '../controllers/add_page_controller.dart';

class AddPage extends GetView<AddPageController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List<String> selected = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              right: screenWidth * 0.05, left: screenWidth * 0.05),
          child:const  Column(
            children: [
              Expanded(
                child: AddExistingCustomer(),
              ),

              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
