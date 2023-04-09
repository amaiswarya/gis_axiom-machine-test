import 'package:get/get.dart';
import 'package:gis_axiom_test/routes/route_name.dart';
import 'package:gis_axiom_test/src/views/home/list_screen.dart';
import 'package:gis_axiom_test/src/views/splash/splash_screen.dart';
import 'bindings.dart';

const duration = Duration(milliseconds: 500);
const transition = Transition.fade;

class RoutesPages {
  static List<GetPage> routes = [
    //splash screen
    GetPage(
      name: RouteNames.splashRoute,
      page: () => const SpashScreen(),
      transition: transition,
      transitionDuration: duration,
    ),
    //list screen
    GetPage(
        name: RouteNames.homeList,
        page: () => ListScreen(),
        transition: transition,
        transitionDuration: duration,
        binding: HomeBinding()),
  ];
}
