import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gis_axiom_test/src/constants/string_constants.dart';
import '../../controller/home_controller.dart';
import 'widgets/menu_item.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => controller.isLoading.value == true
                ? loadingWidget()
                : SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                        child: Column(children: [
                          Text(
                            controller.pageTitle.value,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ]),
                      ),
                      Container(
                        child: controller.menuList.isEmpty
                            ? Center(
                                child: Text(StringConstants.productNotFound),
                              )
                            : ListView.builder(
                                itemCount: controller.menuList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return MenuItemWidget(
                                    isActive:
                                        controller.menuList[index].isActive,
                                    name: controller.menuList[index].name,
                                    products:
                                        controller.menuList[index].products,
                                    sliderImage:
                                        controller.menuList[index].sliderImage,
                                    size: size,
                                  );
                                }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      bottomWidget(controller),
                    ]),
                  )),
      ),
    );
  }

  Column bottomWidget(HomeController controller) {
    return Column(children: [
      Text(StringConstants.about),
      Text(controller.webSiteData[0].aboutUs),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.webSiteData[0].phone),
            const SizedBox(
              width: 10,
            ),
            Text(controller.webSiteData[0].email),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(controller.webSiteData[0].copyright),
      ),
    ]);
  }

  Center loadingWidget() {
    return const Center(
        child: SizedBox(
            height: 30, width: 30, child: CircularProgressIndicator()));
  }
}
