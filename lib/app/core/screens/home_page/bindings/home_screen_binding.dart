import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/controllers/add_page_controller.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/controllers/customers_screen_controller.dart';
import '../controllers/home_screen_controller.dart';
class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<AddPageController>(() => AddPageController());
    Get.lazyPut<CustomersScreenController>(() => CustomersScreenController());
  }

}