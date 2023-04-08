import 'package:fluttertoast/fluttertoast.dart';
import 'package:gis_axiom_test/src/constants/color_constants.dart';

///Toast widget
class AppToast {
  static showToast(String txt) {
    Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.colorBlack,
        textColor: AppColors.colorWhite,
        fontSize: 16.0);
  }
}
