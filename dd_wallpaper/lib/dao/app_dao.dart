import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const HOME_URL = "http://service.aibizhi.adesk.com/v1/lightwp/vertical";

class APPDao {
  static Future<String> loadData() async{
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      return response.toString();
    } else {
        print("1234");
    }
  }
}