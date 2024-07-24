import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/views/add_existing_customer.dart';
import '../controllers/add_page_controller.dart';

class AddPage extends GetView<AddPageController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text('Add Page'),
        backgroundColor: Colors.blue,
      ),
      body:const Column(
        children: [

          Expanded(
            child: AddExistingCustomer(),

          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
