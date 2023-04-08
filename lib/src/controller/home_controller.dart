import 'package:get/get.dart';

import '../constants/api_constants.dart';
import '../service/http_services.dart';

class HomeController extends GetxController {
  HttpServices? service;
  HomeController() {
    service = Get.find<HttpServices>();
  }
  @override
  void onInit() {
    getRestaurantList();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  Future getRestaurantList() async {
    var response = await service!.post(ApiConstants.menuListApi, formData());
    print(response);
  }

  formData() {
    return {
      "restaurant": "LeisureInnVKL",
    };
  }
}
