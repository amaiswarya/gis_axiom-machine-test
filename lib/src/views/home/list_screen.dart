import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import 'menu_details.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => controller.isLoading.value == true
              ? Center(
                  child: Container(
                      height: 30,
                      width: 30,
                      child: const CircularProgressIndicator()
                      //

                      ))
              : controller.webSiteData.isEmpty
                  ? Center(
                      child: Text("Data not found"),
                    )
                  : Column(children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.green,
                        child: Column(children: [
                          Text(controller.webSiteData[0].phone),
                          Text("Address"),
                          Text("Location"),
                          Text("Phone number"),
                          Text("Email"),
                        ]),
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.red,
                        child: controller.menunList.isEmpty
                            ? Center(
                                child: Text("Data not found"),
                              )
                            : ListView.builder(
                                itemCount: controller.menunList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(MenuDetails(
                                        products: controller
                                            .menunList[index].products,
                                      ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 100,
                                        child: Row(children: [
                                          Container(
                                            width: 100,
                                            color: Colors.blue,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(controller
                                                  .menunList[index].name),
                                              Text(controller
                                                  .menunList[index].sliderDesc),
                                              Text("Location"),
                                              Text("Phone number"),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  );
                                }),
                      ))
                    ])),
    );
  }
}
