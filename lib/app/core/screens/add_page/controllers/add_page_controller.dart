import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/models/customer_model.dart';
import '../../../../../repository/customer_repository/customer_repository.dart';

class AddPageController extends FullLifeCycleController
    with FullLifeCycleMixin {
  //TODO -> Use Infinite Scroller if needed
  // static const _pageSize = 10;
  // final PagingController<int, DocumentSnapshot> pagingController =
  // PagingController(firstPageKey: 0);

  var productTypes = <String>[].obs;
  var products = <String>[].obs;
  var selectedProductType = ''.obs;
  var userPhoneNumber = ''.obs;
  var selectedProduct = ''.obs;
  var userOrders = <Map<String, dynamic>>[].obs;
  TextEditingController unitController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountReceived = TextEditingController();
  TextEditingController costController = TextEditingController();
  final CustomerRepository customerRepository = Get.find();
  var selectedCustomer = ''.obs;
  var unitText = ''.obs;
  var costText = ''.obs;
  var amountReceivedText = ''.obs;


  @override
  void onInit() {
    //TODO -> Use Infinite Scroller if needed
    // pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.onInit();
    unitController.addListener(() {
      unitText.value = unitController.text;
    });
    costController.addListener(() {
      costText.value = costController.text;
    });
    amountReceived.addListener(() {
      amountReceivedText.value = amountReceived.text;
    });
    fetchUserOrders();
    productType();
    getProducts();

  }

  void setSelectedProductType(String value) {
    selectedProductType.value = value;
    getProducts();
  }

  void setSelectedProduct(String product) {
    selectedProduct.value = product;
  }

  //!Fetch current day orders of customers
  void fetchUserOrders() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('customer')
          .where('timestamp', isGreaterThanOrEqualTo: startOfDay)
          .where('timestamp', isLessThanOrEqualTo: endOfDay)
          .orderBy('timestamp')
          .get();

      userOrders.clear();

      for (var doc in querySnapshot.docs) {
        userOrders.add(doc.data() as Map<String, dynamic>);
      }

    } catch (e) {
      print('Error fetching user orders: $e');
    }
  }


  //!Store Cost according to products (eg-: cements, bricks etc)
  void storeCost() async {
    try {
      double unitCost = double.tryParse(unitController.text) ?? 0;
      double productCost = double.tryParse(costController.text) ?? 0;
      double totalCost = unitCost * productCost;
    //!Get the values to check if product already exist or not
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('cost')
          .doc(selectedCustomer.toString())
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> existingData = documentSnapshot.data() as Map<String, dynamic>;

        if (existingData.containsKey(selectedProduct.toString())) {
          double currentCost = existingData[selectedProduct.toString()];
          totalCost += currentCost;
        }
        existingData[selectedProduct.toString()] = totalCost;

        await FirebaseFirestore.instance
            .collection('cost')
            .doc(selectedCustomer.toString())
            .set(existingData);
      }
      //!If product doesn't exit already create new field and add cost
      else {
        Map<String, dynamic> newData = {
          selectedProduct.toString(): totalCost,
        };
        await FirebaseFirestore.instance
            .collection('cost')
            .doc(selectedCustomer.toString())
            .set(newData);
      }
      print('Cost information stored successfully.');
    } catch (e) {
      print('Error storing cost information: $e');
    }
  }

  //!update user amount (eg-: Total Amount, Amount Paid, and Amount Left)
  void userAmount() async {
    double unitCost = double.tryParse(unitController.text) ?? 0;
    double productCost = double.tryParse(costController.text) ?? 0;
    double totalCost = unitCost * productCost;

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('phoneNumber', isEqualTo: selectedCustomer.toString())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          if (!doc.exists) {
            print('Document does not exist!');
            continue;
          }

          // Ensure doc.data() is of type Map<String, dynamic>
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

          // Check if data is not null and if key already exists
          if (data != null && data.containsKey('totalAmount')) {
            // Retrieve current totalAmount and convert to double
            dynamic currentTotalAmount = data['totalAmount'];
            double parsedCurrentTotalAmount =
            currentTotalAmount is String
                ? double.tryParse(currentTotalAmount) ?? 0
                : (currentTotalAmount ?? 0).toDouble();

            // Fetch received amount and add your current received amount
            dynamic currentReceivedAmount = data['receivedAmount'];
            double parsedCurrentReceivedAmount =
            currentReceivedAmount is String
                ? double.tryParse(currentReceivedAmount) ?? 0
                : (currentReceivedAmount ?? 0).toDouble();

            // Calculate new totalAmount
            double newTotalAmount = parsedCurrentTotalAmount + totalCost;
            // Calculate new receivedAmount
            double newReceivedAmount =
                parsedCurrentReceivedAmount + (double.tryParse(amountReceived.text) ?? 0);
            // Calculate new amountLeft
            double newAmountLeft = newTotalAmount - newReceivedAmount;

            // Update Firestore document with new totalAmount, amountReceived, and amountLeft
            await FirebaseFirestore.instance
                .collection('clients')
                .doc(doc.id)
                .update({
              'totalAmount': newTotalAmount.toString(),
              'amountReceived': newReceivedAmount.toString(),
              'amountLeft': newAmountLeft.toString(),
            });
          }
          // If key doesn't already exist
          else {
            double? totalAmountReceived = totalCost - (double.tryParse(amountReceived.text) ?? 0);

            await FirebaseFirestore.instance
                .collection('clients')
                .doc(doc.id)
                .update({
              'totalAmount': totalCost.toString(),
              'amountReceived': amountReceived.text.toString(),
              'amountLeft': totalAmountReceived.toString(),
            });
          }
        }
      } else {
        print('No documents found for the given phoneNumber');
      }
    } catch (e) {
      print('Error storing cost information: $e');
    }
  }



  void addUserOrderData(Map<String, dynamic> data) async {
    data['timestamp'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance.collection("orders").doc().set(data);
  }

  //!Fetch all products from inventory collection to show in drop down
  void getProducts() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('inventory')
          .where('productType', isEqualTo: selectedProductType.value)
          .get();

      products.clear();
      for (var doc in querySnapshot.docs) {
        List<dynamic> productList = doc['products'];
        productList.forEach((type) {
          products.add(type as String);
        });
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  //!Fetch all productTypes from inventory collection to show in drop down
  void productType() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('inventory')
          .orderBy('productType')
          .get();

      productTypes.clear();
      querySnapshot.docs.forEach((doc) {
        productTypes.add(doc['productType'] as String);
      });

      if (productTypes.isNotEmpty) {
        setSelectedProductType(productTypes.first);
      }
    } catch (e) {
      print('Error fetching product types: $e');
    }
  }

  //!On submit button click store all data filled in text controller and selected in drop down
  void onSubmitButtonClick() async {
    final phoneNumber = phoneController.text.trim();
    final name = nameController.text.trim().toLowerCase();
    final address = addressController.text.trim();

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (phoneNumber.isEmpty || name.isEmpty || address.isEmpty) {
        Get.snackbar("Error", "Fill all fields",
            snackPosition: SnackPosition.BOTTOM);
      } else if (phoneNumber.length < 10) {
        Get.snackbar("Error", "Phone number must have 10 digits",
            snackPosition: SnackPosition.BOTTOM);
      } else if (querySnapshot.docs.isNotEmpty) {
        Get.snackbar('Error', 'Customer with this phone number already exists.',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        final customer = CustomerModel(
          id: null,
          name: name,
          phoneNumber: phoneNumber,
          address: address,
        );

        try {
          DocumentReference<Object?>? newCustomerRef =
              await customerRepository.createCustomer(customer);

          if (newCustomerRef == null) {
            throw Exception('Failed to create customer document');
          }

          nameController.clear();
          phoneController.clear();
          addressController.clear();

          print('New customer document reference: ${newCustomerRef.id}');
        } catch (e) {
          print('Error creating customer: $e');
          Get.snackbar('Error', 'Failed to create customer.',
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      print('Error checking existing customer: $e');
      Get.snackbar('Error', 'Failed to check existing customer.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onDetached() {
    // Handle onDetached
  }

  @override
  void onHidden() {
    //TODO: onHidden
  }

  @override
  void onInactive() {
    //TODO: onInactive
  }

  @override
  void onPaused() {
    //TODO: onPaused
  }

  @override
  void onResumed() {
    //TODO: onResumed
  }
}
