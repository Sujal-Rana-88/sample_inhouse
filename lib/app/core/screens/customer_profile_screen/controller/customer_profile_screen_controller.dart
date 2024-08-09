import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerProfileScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  var userOrders = <Map<String, dynamic>>[].obs;
  var selectedUserPhoneNumber = ''.obs;
  var selectedUserName = ''.obs;
  var selectedUserAddress = ''.obs;
  var selectedUserAmount = ''.obs;
  var isLoading = false.obs;

  @override
  @override
  void onInit() {
    // tabController = TabController(length: 2, vsync: this);
    super.onInit();
    final data = Get.arguments as List?;
    if (data != null && data.length >= 2) {
      selectedUserPhoneNumber.value = data[0] as String? ?? '';
      selectedUserName.value = data[1] as String? ?? '';
      selectedUserAddress.value = data[2] as String? ?? '';
      selectedUserAmount.value = data[3] as String? ?? '';
      fetchUserOrders();
    } else {
      // Handle invalid arguments
      print('Invalid or missing arguments');
    }
  }


  Future<void> fetchUserOrders() async {
    isLoading.value = true;
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('customer', isEqualTo: selectedUserPhoneNumber.value)
          .orderBy('timestamp')
          .get();

      userOrders.clear();
      for (var doc in querySnapshot.docs) {
        userOrders.add(doc.data() as Map<String, dynamic>);
      }
      print('Fetched orders: ${userOrders.length}');
    } catch (e) {
      print('Error fetching user orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }


}
