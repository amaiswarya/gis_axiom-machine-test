import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../views/common_widgets/toast.dart';

class HttpServices {
  Future<dynamic> post(String uri, Map<String, dynamic> params) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.post(url, body: params);
      var responseJson = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseJson;
      } else {
        AppToast.showToast("Something went wrong");
        return null;
      }
    } on SocketException {
      throw "error";
    }
  }
}
