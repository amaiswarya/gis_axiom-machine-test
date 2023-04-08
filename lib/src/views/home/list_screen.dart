import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gis_axiom_test/routes/bindings.dart';

import '../../controller/home_controller.dart';
import 'menu_details.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
              : Column(children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green,
                    child: Column(children: [
                      Text("Name"),
                      Text("Address"),
                      Text("Location"),
                      Text("Phone number"),
                      Text("Email"),
                    ]),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.red,
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(MenuDetails());
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Name"),
                                      Text("Address"),
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
