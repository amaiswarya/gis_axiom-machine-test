import 'package:get/get.dart';

import '../constants/api_constants.dart';
import '../models/restaurant_model.dart';
import '../service/http_services.dart';

class HomeController extends GetxController {
  HttpServices? service;
  HomeController() {
    service = Get.find<HttpServices>();
  }
  List<MenuItem> menuList = <MenuItem>[].obs;
  List<Website> webSiteData = <Website>[].obs;
  RxString pageTitle = "".obs;

  @override
  void onInit() {
    getRestaurantList();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  Future getRestaurantList() async {
    showLoading();
    webSiteData.clear();
    var response = await service!.post(ApiConstants.menuListApi, formData());
    if (response != null) {
      RestaurantModel restaurantSata = RestaurantModel.fromJson(response);
      webSiteData.add(restaurantSata.website);
      pageTitle.value = restaurantSata.pageTitle;
      menuList = restaurantSata.menuItems;

      hideLoading();
    } else {
      hideLoading();
    }
  }

// display loader while loading the data
  showLoading() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 10), () {
      if (isLoading.value == true) {
        isLoading.value = false;
      }
      update();
    });
  }

// hides the loader after loading the data
  hideLoading() {
    isLoading.value = false;
    update();
  }

  formData() {
    return {
      "restaurant": "LeisureInnVKL",
    };
  }
}
