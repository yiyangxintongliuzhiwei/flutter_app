import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myapp1/views/investment/components/smart_component/topswiper.dart';
import './smart_component/pageview.dart';
import './smart_component/topswiper.dart';
import './smart_component/remond.dart';
import './smart_component/Daynews.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Smart extends StatefulWidget {
  @override
  _SmartState createState() => _SmartState();
}

num str = 0;

class _SmartState extends State<Smart> {
  @override
  Widget build(BuildContext context) {
    // 初始化
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return new EasyRefresh(
      header: ClassicalHeader(
        refreshReadyText: '放手也是一种美丽',
        refreshingText: '正在刷新',
        refreshedText: '刷新完成',
      ),
      onRefresh: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            str = str + 1;
            print(str);
          });
        });
      },
      child: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Container(child: Pageview()),
        Container(child: Topswiper()),
        Container(child: CustomTabBarView()),
        Container(
          child: Daynews(),
        )
      ]),
    );
  }
}
