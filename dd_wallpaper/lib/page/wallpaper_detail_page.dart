import 'package:flutter/material.dart';

class WallpaperDetail extends StatefulWidget {
  final String image_url;

  WallpaperDetail({@required this.image_url});

  @override
  _WallpaperDetailState createState() => _WallpaperDetailState();
}

class _WallpaperDetailState extends State<WallpaperDetail> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            child: Image.network(
          widget.image_url,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 50 + MediaQuery.of(context).padding.bottom,
            color: Color(0x50000000),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.red,
                  height: 40,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
