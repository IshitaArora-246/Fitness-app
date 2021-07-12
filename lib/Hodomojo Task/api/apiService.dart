import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> fetchData() async {
    try {
      String url =
          "http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json";
      // print("url entered - Step 1");

      Uri uri = Uri.parse(url);
      http.Response r = await http.get(uri);
      // print("response saved in r : step 2");

      Map<String, dynamic> jsonMap = jsonDecode(r.body);
      // print("json decoded : step 3");

      return jsonMap;

      // var data = jsonMap['data'];
      // print("list of data maps extracted : step 4");

      // List<Map<String, dynamic> dataMap = data["components"];
      // log(dataMap.toString());
      // print("required data extracted: step 5");
      // return dataMap;
    } catch (e) {
      print("Catch block Error Detected: $e");
      return {'data': "Data not available"};
    }
  }
}
