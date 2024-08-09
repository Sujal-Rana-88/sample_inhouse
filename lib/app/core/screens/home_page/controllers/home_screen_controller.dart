import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/models/customer_model.dart';
import '../../../../../repository/customer_repository/customer_repository.dart';

class HomeScreenController extends FullLifeCycleController
    with FullLifeCycleMixin {
  var tabIndex = 0.obs;
  late TabController tabController;
  var pageIndex = 0.obs;
  var userOrders = <Map<String, dynamic>>[].obs;
  var day = "".obs;
  var month = "".obs;
  var year = "".obs;

  changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onInit() {
    getTodayUserOrders();
    super.onInit();
  }

  //!Fetch current day orders of customers
  Future<void> getTodayUserOrders() async {
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

  //!Fetch orders of customers according to date
  Future<void> getUserOrdersByDate() async {
    try {
      int? currYear = int.tryParse(year.value);
      int? currMonth = int.tryParse(month.value);
      int? currDay = int.tryParse(day.value);

      if (currYear != null && currMonth != null && currDay != null) {
        DateTime startOfDay = DateTime(currYear, currMonth, currDay, 0, 0, 0);
        DateTime endOfDay = DateTime(currYear, currMonth, currDay, 23, 59, 59);

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
      }
    } catch (e) {
      print('Error fetching user orders: $e');
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
