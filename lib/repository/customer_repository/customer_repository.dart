import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/core/models/customer_model.dart';

//!Add Customer to Firebase
class CustomerRepository extends GetxController {
  static CustomerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<DocumentReference?> createCustomer(CustomerModel customer) async {
    try {
      DocumentReference docRef =
          await _db.collection("clients").add(customer.toJson());
      Get.snackbar(
        "Success",
        "Customer has been added",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
      return docRef;
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return null;
    }
  }

  Future<List<String>> fetchCustomerNames() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("clients").get();
      return querySnapshot.docs.map((doc) => doc['name'] as String).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch customer names");
      return [];
    }
  }
}
