import 'package:dd_wallpaper/model/wallpaper_model.dart';

class HomeModel {
  final List<WallpaperModel> wallpaperList;

  HomeModel({this.wallpaperList});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var wallpaperListJson = json["res"]["vertical"] as List;
    List<WallpaperModel> wallpaperList = wallpaperListJson.map((i) => WallpaperModel.fromJson(i)).toList();
    return HomeModel(wallpaperList: wallpaperList);
  }
}