import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_page_controller.dart';

class ProductsDropdown extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ProductsDropdown({
    super.key,
    required this.onChanged,
  });

  @override
  State<ProductsDropdown> createState() => _ProductsDropdownState();
}

class _ProductsDropdownState extends State<ProductsDropdown> {
  // Initialize the controller
  final AddPageController addPageController = Get.find<AddPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (addPageController.products.isEmpty) {
        return DropdownButton<String>(
          value: 'Normal',
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: const SizedBox.shrink(),
          onChanged: (String? value) {
            addPageController.setSelectedProduct('Normal');
            widget.onChanged('Normal');
          },
          items: <String>['Normal']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      } else {
        return DropdownButton<String>(
          value: addPageController.selectedProduct.value.isEmpty
              ? addPageController.products.first
              : addPageController.selectedProduct.value,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: const SizedBox.shrink(),
          onChanged: (String? value) {
            if (value != null) {
              addPageController.setSelectedProduct(value);
              widget.onChanged(value);
            }
          },
          items: addPageController.products
              .map<DropdownMenuItem<String>>((String value){
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
