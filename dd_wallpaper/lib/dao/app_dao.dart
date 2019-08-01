import 'dart:async';
import 'dart:convert';

import 'package:dd_wallpaper/model/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = "http://service.aibizhi.adesk.com/v1/lightwp/vertical?skip=";

class APPDao {
  static Future<HomeModel> loadData(int index) async {
    final response = await http.get(HOME_URL + (index*30).toString());
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception("fail");
    }
  }
}
