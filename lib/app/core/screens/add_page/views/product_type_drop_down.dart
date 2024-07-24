import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_page_controller.dart';

class ProductTypeDropDown extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ProductTypeDropDown({
    super.key,
    required this.onChanged,
  });

  @override
  State<ProductTypeDropDown> createState() => _ProductTypeDropDownState();
}

class _ProductTypeDropDownState extends State<ProductTypeDropDown> {
  // Initialize the controller
  final AddPageController addPageController = Get.find<AddPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (addPageController.productTypes.isEmpty) {
        return const DropdownMenuItem<String>(
          child: Text('No values available'),
        );
      } else {
        return DropdownButton<String>(
          value: addPageController.selectedProductType.value.isEmpty
              ? addPageController.productTypes.first
              : addPageController.selectedProductType.value,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: const SizedBox.shrink(),
          onChanged: (String? value) {
            if (value != null) {
              addPageController.setSelectedProductType(value);
              widget.onChanged(value);
            }
          },
          items: addPageController.productTypes
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      }
    });
  }
}
