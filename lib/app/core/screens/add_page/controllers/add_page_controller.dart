import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/models/customer_model.dart';
import '../../../../../repository/customer_repository/customer_repository.dart';
import '../views/product_pair.dart';

class AddPageController extends FullLifeCycleController
    with FullLifeCycleMixin {
  //! Use Infinite Scroller if needed
  // static const _pageSize = 10;
  // final PagingController<int, DocumentSnapshot> pagingController =
  // PagingController(firstPageKey: 0);

  var productTypes = <String>[].obs;
  var products = <String>[].obs;
  var selectedProductType = ''.obs;
  var userPhoneNumber = ''.obs;
  var selectedProducts = <String>[].obs;

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
  List<ProductPair> productPairs = [];
  List<String> selected = [];

  @override
  void onInit() {
    //! Use Infinite Scroller if needed
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





  void addProductPair(String product, String productType, String cost, String unit) {
    productPairs.add(ProductPair(product, productType, cost, unit));
  }

  void removeProductPair(String product) {
    productPairs.removeWhere((pair) => pair.product == product);
  }


  void setSelectedProductType(String value) {
    selectedProductType.value = value;
    getProducts();
  }



  //!Fetch current day orders of customers
  Future<void> fetchUserOrders() async {
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
  Future<void> storeProductData() async {
    try {
      List<Map<String, String>> productsList = [];

      //! Iterate through the productPairs list to populate the list of maps
      for (var pair in productPairs) {
        productsList.add({
          'productName': pair.product,
          'productType': pair.productType,
          'price': pair.cost,
          'unit': pair.unit,
        });
      }

      // Creating a map to store in Firestore
      Map<String, dynamic> productData = {
        'customer': selectedCustomer.toString(),
        'products': productsList,
      };

      await FirebaseFirestore.instance
          .collection('orders')
          .doc()
          .set(productData);

      print('Product data stored successfully.');
    } catch (e) {
      print('Error storing product data: $e');
    }
  }



  //!update user amount (eg-: Total Amount, Amount Paid, and Amount Left)
  Future<void> userAmount() async {
    double unit = double.tryParse(unitController.text) ?? 0;
    double productCost = double.tryParse(costController.text) ?? 0;
    double totalCost = unit * productCost;
    double receivedAmount = double.tryParse(amountReceived.text) ?? 0;

    try {
      // Access the document directly by its ID
      final docRef = FirebaseFirestore.instance
          .collection('wallet')
          .doc(selectedCustomer.toString());

      // Get the document
      final doc = await docRef.get();

      if (doc.exists) {
        // Ensure doc.data() is of type Map<String, dynamic>
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          // Retrieve current totalAmount and convert to double
          double parsedCurrentTotalAmount = (data['totalAmount'] is String
              ? double.tryParse(data['totalAmount']) ?? 0
              : (data['totalAmount'] ?? 0).toDouble());

          // Retrieve current receivedAmount and convert to double
          double parsedCurrentReceivedAmount = (data['amountReceived'] is String
              ? double.tryParse(data['amountReceived']) ?? 0
              : (data['amountReceived'] ?? 0).toDouble());

          // Calculate new values
          double newTotalAmount = parsedCurrentTotalAmount + totalCost;
          double newReceivedAmount = parsedCurrentReceivedAmount + receivedAmount;
          double newAmountLeft = newTotalAmount - newReceivedAmount;

          // Update the document
          await docRef.update({
            'totalAmount': newTotalAmount.toString(),
            'amountReceived': newReceivedAmount.toString(),
            'amountLeft': newAmountLeft.toString(),
          });
        }
      } else {
        // Document does not exist, create a new one
        double totalAmountLeft = totalCost - receivedAmount;

        await docRef.set({
          'totalAmount': totalCost.toString(),
          'amountReceived': receivedAmount.toString(),
          'amountLeft': totalAmountLeft.toString(),
        });

        print('New document created with ID equal to the phone number');
      }
    } catch (e) {
      print('Error storing cost information: $e');
    }
  }



  Future<void> addUserOrderData(Map<String, dynamic> data) async {
    data['timestamp'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance.collection("orders").doc().set(data);
  }

  //!Fetch all products from inventory collection to show in drop down
  Future<void> getProducts() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('inventory')
          .where('productType', isEqualTo: selectedProductType.value)
          .get();

      products.clear();
      for (var doc in querySnapshot.docs) {
        List<dynamic> productList = doc['products']; // Access the 'products' field
        for (var product in productList) {
          if (product is String && !products.contains(product)) {
            products.add(product);
          }
        }
      }

      print('Fetched products: $products'); // Log the fetched products
    } catch (e) {
      print('Error fetching products: $e');
    }
  }


  //!Fetch all productTypes from inventory collection to show in drop down
  Future<void> productType() async {
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

  //!On submit button (Create New Customer)
  Future<void> onSubmitButtonClick() async {
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
          name: name.toLowerCase(),
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

  //! Show suggestion of previous cost for customer. If no previous cost exists, do not show suggestion.
  // Future<void> getPreviousCost() async {
  //   try {
  //     final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('orders')
  //         .where('customer', isEqualTo: userPhoneNumber.toString())
  //         .where('product', isEqualTo: selectedProduct.value)
  //         .where('productType', isEqualTo: selectedProductType.value)
  //         .orderBy('timestamp', descending: true)
  //         .limit(1)
  //         .get();
  //
  //     if (querySnapshot.docs.isNotEmpty) {
  //       final Map<String, dynamic> lastOrder = querySnapshot.docs.first.data() as Map<String, dynamic>;
  //       final String previousPriceStr = lastOrder['price'] ?? '0'; // Ensure value exists
  //       final String previousUnitsStr = lastOrder['unit'] ?? '1'; // Ensure value exists
  //       final double previousPrice = double.tryParse(previousPriceStr) ?? 0.0;
  //       final double previousUnits = double.tryParse(previousUnitsStr) ?? 1.0;
  //       final double finalPrice = previousPrice * previousUnits;
  //       costController.text = finalPrice.toString();
  //
  //       print('Previous price: $previousPrice');
  //     } else {
  //       print('No previous orders found.');
  //     }
  //   } catch (e) {
  //     print('Error fetching user orders: $e');
  //   }
  // }


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
