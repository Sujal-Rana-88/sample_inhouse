import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/order_details/controllers/order_details_screen_controller.dart';

class OrderDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsScreenController>(() => OrderDetailsScreenController());
  }

}