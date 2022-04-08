import 'package:crypto/controllers/currency_controller.dart';
import 'package:get/get.dart';

class ControllerBindings {
  void dependencies() {
    Get.put(CurrencyController());
  }
}
