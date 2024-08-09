import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomersScreenController extends FullLifeCycleController
    with FullLifeCycleMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneNumberController =
      TextEditingController();
  final TextEditingController userAmountReceived = TextEditingController();
  var phoneNumber = ''.obs;
  var walletData = {}.obs;
  var customerData = {}.obs;
  static const _pageSize = 10;
  final PagingController<int, DocumentSnapshot> pagingController =
      PagingController(firstPageKey: 0);
  String _searchQuery = '';
  final isLoading = true.obs;
  @override
  void onInit() {
     pagingController.addPageRequestListener((pageKey) async {
       await _fetchPage(pageKey);
    });
     // _loadInitialData();
    super.onInit();
  }



  void updateSearchQuery(String query) {
    _searchQuery = query.trim();
    pagingController.refresh();
  }

  //!use this function in bottomsheet so when user add amount page refresh and data change in ui
  // Future<void> refreshData() async {
  //   pagingController.refresh();
  // }

  //!Fetch user data with limit of 10
  Future<void> _fetchPage(int pageKey) async {
    try {
      QuerySnapshot querySnapshot;
      Query query = FirebaseFirestore.instance.collection('clients').orderBy('name');

      if (_searchQuery.isNotEmpty) {
        query = query
            .where('name', isGreaterThanOrEqualTo: _searchQuery)
            .where('name', isLessThan: '$_searchQuery\uf8ff');
      }

      if (pageKey == 0) {
        querySnapshot = await query.limit(_pageSize).get();
      } else {
        final lastDocument = pagingController.itemList?.last;
        if (lastDocument != null) {
          querySnapshot = await query
              .startAfterDocument(lastDocument)
              .limit(_pageSize)
              .get();
        } else {
          throw Exception('Last document is null');
        }
      }

      final isLastPage = querySnapshot.docs.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(querySnapshot.docs);
      } else {
        final nextPageKey = pageKey + querySnapshot.docs.length;
        pagingController.appendPage(querySnapshot.docs, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  //! Add Payment Of customer from bottom sheet
  Future<void> addPayment(String phoneNumber) async {
    // Parse the additional amount as a double from the input text
    double additionalAmount = double.tryParse(userAmountReceived.text) ?? 0.0;

    try {
      DocumentReference walletDocRef =
     FirebaseFirestore.instance.collection('wallet').doc(phoneNumber);

      DocumentSnapshot walletDoc = await walletDocRef.get();

      double currentAmountLeft = 0;
      double amountReceived = 0;
      if (walletDoc.exists && walletDoc.data() != null) {
        // Get the current amountLeft and amountReceived from the document
        Map<String, dynamic> walletData =
        walletDoc.data() as Map<String, dynamic>;
        amountReceived = double.tryParse(walletData['amountReceived'] as String) ?? 0;
        currentAmountLeft = double.tryParse(walletData['amountLeft'] as String) ?? 0;
      }

      double newAmountLeft = currentAmountLeft - additionalAmount;
      double newAmountReceived = amountReceived + additionalAmount;
  //!If amount you received is more than user debt amount or amount left to paid
      if (newAmountLeft < 0) {
        Get.snackbar(
          "Error:",
          "The payment exceeds the amount left.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
        );
      } else {
        await walletDocRef.set(
          {
            'amountLeft': newAmountLeft.toString(),
            'amountReceived': newAmountReceived.toString(),
          },
          SetOptions(merge: true),
        );
        walletData[phoneNumber] = {
          'amountLeft': newAmountLeft.toString(),
          'amountReceived': newAmountReceived.toString(),
        };
        Get.snackbar(
          "Success",
          "Amount added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
        );
      }
    } catch (error) {
      print('Error setting amountLeft: $error');
    }
  }

  //!  Fetch Wallet amount using user phone number
  Future<Map<String, dynamic>> fetchWalletDataForCustomer(String phoneNumber) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('wallet')
          .doc(phoneNumber)
          .get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      // Handle errors
      print('Error fetching wallet data: $e');
      return {};
    }
  }
  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
