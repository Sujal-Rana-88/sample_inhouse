import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneNumberController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();

  var selectedUserPhoneNumber = ''.obs;
  var selectedUserName = ''.obs;
  var selectedUserAddress = ''.obs;
  var selectedUserAmount = ''.obs;

  @override
  void onInit() {
    final data = Get.arguments as List?;
    if (data != null && data.length >= 3) {
      userPhoneNumberController.text = data[0] as String? ?? '';
      selectedUserPhoneNumber.value = data[0] as String? ?? '';
      userNameController.text = data[1] as String? ?? '';
      userAddressController.text = data[2] as String? ?? '';
    }
    super.onInit();
  }

  Future<void> onSaveButton() async {
    final String phoneNumber = selectedUserPhoneNumber.value;

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('clients')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.update({
          // Add the fields you want to update here
          'name': userNameController.text.toString(),
          'Address': userAddressController.text.toString(),
        });
      }
      Get.snackbar(
        "Success",
        "Information updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );

    } catch (e) {
      print('Error updating documents: $e');
    }
  }


  @override
  void onDetached() {
    // Implement onDetached if needed
  }

  @override
  void onHidden() {
    // Implement onHidden if needed
  }

  @override
  void onInactive() {
    // Implement onInactive if needed
  }

  @override
  void onPaused() {
    // Implement onPaused if needed
  }

  @override
  void onResumed() {
    // Implement onResumed if needed
  }
}
