import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gis_axiom_test/routes/route_name.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gis axiom machine test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RoutesPages.routes,
      initialRoute: RouteNames.homeList,
    );
  }
}
