import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './smart_component/topswiper.dart';
import './school_component/video.dart';
import './school_component/latestupdate.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

// 路由 搜索 视频 状态管理 下拉刷新
class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    // 初始化
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
        child: Topswiper(),
      ),
      /* Container(
        child: VideoApp(),
      ) */
      Container(
        child: Latestupdate(),
      )
    ]);
  }
}
