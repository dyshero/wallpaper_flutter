
class WallpaperModel {
  final String img;

  WallpaperModel({this.img});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(img: json["img"]);
  }
}
