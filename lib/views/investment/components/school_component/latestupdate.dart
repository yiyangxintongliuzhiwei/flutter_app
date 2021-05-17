import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors_util.dart';

class Latestupdate extends StatefulWidget {
  @override
  _LatestupdateState createState() => _LatestupdateState();
  List<Map> newList = [
    {'title': '标题标题', 'time': '2021-2-11', 'image': '', 'url': ''}
  ];
}

class _LatestupdateState extends State<Latestupdate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              '最新更新',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  color: ColorUtil.fromHex('#2F2F2F')),
            ),
          ),
          // newList.map()
        ],
      ),
    );
  }
}
