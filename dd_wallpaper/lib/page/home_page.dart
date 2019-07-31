import 'package:dd_wallpaper/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Image.asset(Utils.getImgPath("start_page", format: "jpg"),
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
                  child: Text("Beckoning",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      child: FlatButton(
                      child: Text("开始游戏", style: TextStyle(color: Colors.white, fontSize: 30.0),),
                      onPressed: () {},
                    )),
                    InkWell(
                      child: FlatButton(
                      child: Text("设置", style: TextStyle(color: Colors.white, fontSize: 30.0),),
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
            child: Image.asset(Utils.getImgPath("dandelion"), width: MediaQuery.of(context).size.width*0.5),
          )
        ],
      ),
    );
  }
}
