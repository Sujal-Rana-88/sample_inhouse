import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_page_controller.dart';
import 'package:multiselect/multiselect.dart';
class ProductsDropdown extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ProductsDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ProductsDropdown> createState() => _ProductsDropdownState();
}

class _ProductsDropdownState extends State<ProductsDropdown> {
  // Initialize the controller
  final AddPageController addPageController = Get.find<AddPageController>();
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Container(
        width: 200,

        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: DropDownMultiSelect(
            onChanged: (List<String> x) {
              selected = x;
            },
            // hint: Text('Select'),
            options: addPageController.products.isEmpty
                ? ['Normal']
                : addPageController.products,
            selectedValues: selected,
            // Uncomment if you want to display a placeholder when no options are available
            // whenEmpty: 'Select Something',
          ),
        ),
      );
    });
  }
  }