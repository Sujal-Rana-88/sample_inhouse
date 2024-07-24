import 'package:get/get.dart';
import '../controllers/customers_screen_controller.dart';
class CustomersScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CustomersScreenController>(() => CustomersScreenController());
  }
}