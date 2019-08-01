import 'dart:math';

import 'package:dd_wallpaper/dao/app_dao.dart';
import 'package:dd_wallpaper/model/wallpaper_model.dart';
import 'package:dd_wallpaper/util/utils.dart';
import 'package:dd_wallpaper/page/wallpaper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String img_url = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564641680095&di=9b84ba8e19f0fab42dfc478605672616&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201304%2F26%2F20130426105850_mh8aB.jpeg";

  @override
  void initState() {
    super.initState();

    APPDao.loadData(0).then((homeModel){
      setState(() {
        List<WallpaperModel> wallpaperList = homeModel.wallpaperList;
        WallpaperModel model = wallpaperList[Random().nextInt(wallpaperList.length)];
        img_url = model.img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Image.network(
              img_url,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill),
          Opacity(
              opacity: 0.5,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              )),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                      "Beckoning",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                        child: FlatButton(
                      child: Text(
                        "开始游戏",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return WallpaperPage();
                        }));
                      },
                    )),
                    InkWell(
                        child: FlatButton(
                      child: Text(
                        "设置",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      onPressed: () {},
                    ))
                  ],
                ))
              ],
            ),
          ),
          Positioned(
            bottom: -5,
            right: 0,
            child: Image.asset(Utils.getImgPath("dandelion"),
                width: MediaQuery.of(context).size.width * 0.5),
          )
        ],
      ),
    );
  }
}
