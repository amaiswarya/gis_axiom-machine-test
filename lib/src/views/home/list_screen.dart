import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_details.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
        ]),
      ),
    );
  }
}
