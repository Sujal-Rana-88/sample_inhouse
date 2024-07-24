import 'package:get/get.dart';
import '../controller/customer_profile_screen_controller.dart';

class CustomerProfileScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CustomerProfileScreenController>(() => CustomerProfileScreenController());
  }

}