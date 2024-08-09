import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../controllers/add_page_controller.dart';

class AddNewCustomers extends StatelessWidget {
  AddNewCustomers({super.key});

  final AddPageController addPageController = Get.find<AddPageController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor:
              WidgetStateProperty.all<Color>(CustomColor.orange_bold_color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                backgroundColor: Colors.white,
                scrollable: true,
                title: const Text('Add New Customer'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: addPageController.nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            icon: Icon(Icons.account_box),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          controller: addPageController.phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone No',
                            icon: Icon(Icons.phone),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        TextFormField(
                          controller: addPageController.addressController,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            icon: Icon(Icons.home),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      addPageController.onSubmitButtonClick();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const SizedBox(
          child:Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
