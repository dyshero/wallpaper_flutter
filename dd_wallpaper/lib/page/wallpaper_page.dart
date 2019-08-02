import 'package:flutter/material.dart';
import 'package:dd_wallpaper/model/wallpaper_model.dart';
import 'package:dd_wallpaper/dao/app_dao.dart';
import 'package:dd_wallpaper/page/wallpaper_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WallpaperPage extends StatefulWidget {
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  ScrollController _scrollController = ScrollController();
  List<WallpaperModel> datas = [];
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page++;
        _getData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  _getData() {
    APPDao.loadData(_page).then((homeModel) {
      setState(() {
        datas.addAll(homeModel.wallpaperList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
          )),
      body: Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: RefreshIndicator(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                itemBuilder: (BuildContext context, int index) {
                  return _getItemContainer(datas[index].img);
                },
                itemCount: datas.length,
                controller: _scrollController),
            onRefresh: _onRefresh,
          )),
    );
  }

  _getItemContainer(String url) {
    return Container(
        child: GestureDetector(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.fitWidth,
          )),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WallpaperDetail(image_url: url);
        }));
      },
    ));
  }

  Future<Null> _onRefresh() async {
    _page = 0;
    datas.clear();
    await _getData();
  }
}
