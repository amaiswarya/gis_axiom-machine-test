import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../views/common_widgets/toast.dart';

class HttpServices {
  // post api requests
  Future<dynamic> post(String uri, Map<String, dynamic> params) async {
    try {
      final url = Uri.parse(uri);

      final response = await http.post(url, body: jsonEncode(params));
      var responseJson = json.decode(response.body);
      // print("APi: " +
      //     uri +
      //     "..." +
      //     "Statuscode: " +
      //     response.statusCode.toString());
      //  responseJson = await ResponseException().responseException(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response);
        return responseJson;
      } else {
        AppToast.showToast(responseJson["message"]);
        // print(response.toString());
        return null;
      }
    } on SocketException {
      throw "error";
    }
  }
}
