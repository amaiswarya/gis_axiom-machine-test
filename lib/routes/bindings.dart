import 'package:get/get.dart';

import '../src/controller/home_controller.dart';
import '../src/service/http_services.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpServices());
    Get.put(HomeController());
  }
}
