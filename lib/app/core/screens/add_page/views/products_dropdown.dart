import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../controllers/add_page_controller.dart';

class ProductsDropdown extends StatefulWidget {
  final ValueChanged<List<String>> onChanged;

  const ProductsDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ProductsDropdown> createState() => _ProductsDropdownState();
}

class _ProductsDropdownState extends State<ProductsDropdown> {
  final AddPageController addPageController = Get.find<AddPageController>();
  // List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //! Provide "Normal" as a default option if products list is empty
      final _products = addPageController.products.isEmpty
          ? ['Normal']
          : addPageController.products;

      final _items = _products
          .map((product) => MultiSelectItem<String>(product, product))
          .toList();

      return Container(
        width: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: MultiSelectDialogField(
              buttonIcon: const Icon(Icons.arrow_drop_down_sharp),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
              items: _items,
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                setState(() {
                  List<String> addedProducts = [];
                  for (String product in _products) {
                    if (values.contains(product) &&
                        !addPageController.selected.contains(product)) {
                      // Add new selection
                      addPageController.selected.add(product);

                      // Store productType, cost, and unit
                      String productType = addPageController
                              .productTypes.isEmpty
                          ? 'Normal'
                          : addPageController.selectedProductType.toString();
                      String cost =
                          addPageController.costController.text.isEmpty
                              ? '0'
                              : addPageController.costController.text;
                      String unit =
                          addPageController.unitController.text.isEmpty
                              ? '0'
                              : addPageController.unitController.text;

                      // Clear inputs
                      addPageController.costController.clear();
                      addPageController.unitController.clear();

                      // Add product pair
                      addPageController.addProductPair(
                          product, productType, cost, unit);
                      addedProducts.add(product);
                    } else if (!values.contains(product) &&
                        addPageController.selected.contains(product)) {
                      // Remove deselection
                      addPageController.selected.remove(product);
                      addPageController.removeProductPair(product);
                    }
                  }

                  // Ensure no duplicates are added
                  widget.onChanged(addPageController.selected);
                });

                //! Print all selected values and pairs
                print("Selected values: $addPageController.selected");
                for (var pair in addPageController.productPairs) {
                  print(
                      "[${pair.productType} : ${pair.product}: ${pair.cost} : ${pair.unit}]");
                }
              },
              initialValue: addPageController.selected,
            ),
          ),
        ),
      );
    });
  }
}
