import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors_util.dart';

// 顶部菜单
class Pageview extends StatefulWidget {
  @override
  _PageviewState createState() => _PageviewState();
}

/* 定义变量 */
List navigatorList = [
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png',
    "mallCategoryName": '购物轿车'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/135931/4/3281/5598/5efbf2c0Edbdc82c7/ed9861b4ddfb9f30.png',
    "mallCategoryName": '数码电器'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/140012/8/1804/3641/5efbf318E38bd5dad/0db99d859ab16ce9.png',
    "mallCategoryName": '服饰百货'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png',
    "mallCategoryName": '生鲜鲜美'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png',
    "mallCategoryName": '生鲜鲜美'
  },
];
List navigatorList1 = [
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png',
    "mallCategoryName": '购物轿车'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/135931/4/3281/5598/5efbf2c0Edbdc82c7/ed9861b4ddfb9f30.png',
    "mallCategoryName": '数码电器'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/140012/8/1804/3641/5efbf318E38bd5dad/0db99d859ab16ce9.png',
    "mallCategoryName": '服饰百货'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png',
    "mallCategoryName": '生鲜鲜美'
  },
  {
    "image":
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png',
    "mallCategoryName": '生鲜鲜美'
  },
];

class _PageviewState extends State<Pageview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      color: ColorUtil.fromHex('#E4E4E4'),
      child: new PageView(
          controller: PageController(
            viewportFraction: 0.9, // 控制一页占不占满
            initialPage: 0, // 默认第几页
            keepPage: true, // 保持页面状态
          ),
          onPageChanged: (int index) {},
          children: <Widget>[
            Container(
              // padding: EdgeInsets.all(18),
              padding: EdgeInsets.only(top: 22, left: 0, right: 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: navigatorList.map((item) {
                  return InkWell(
                    // onTap: () {
                    //   print('点击了导航');
                    // },
                    child: Column(
                      children: <Widget>[
                        /* Image.network(
                          item['image'],
                          width: ScreenUtil().setWidth(90)
                        ), */
                        Container(
                          height: ScreenUtil().setHeight(86),
                          width: ScreenUtil().setWidth(86),
                          margin: EdgeInsets.only(
                              top: 0, left: 0, right: 0, bottom: 5),
                          decoration: new BoxDecoration(
                              color: Color(0xFF9E9E9E),
                              borderRadius: new BorderRadius.circular((86.0))),
                        ),
                        Text(
                          item['mallCategoryName'],
                          style: TextStyle(fontSize: ScreenUtil().setSp(26)),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 0, right: 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: navigatorList.map((item) {
                  return InkWell(
                    // onTap: () {
                    //   print('点击了导航');
                    // },
                    child: Column(
                      children: <Widget>[
                        /* Image.network(item['image'],
                            width: ScreenUtil().setWidth(90)), */

                        Container(
                          height: ScreenUtil().setHeight(86),
                          width: ScreenUtil().setWidth(86),
                          margin: EdgeInsets.only(
                              top: 0, left: 0, right: 0, bottom: 5),
                          decoration: new BoxDecoration(
                              color: Color(0xFF9E9E9E),
                              borderRadius: new BorderRadius.circular((86.0))),
                        ),
                        Text(
                          item['mallCategoryName'],
                          style: TextStyle(fontSize: ScreenUtil().setSp(26)),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ]),
    );
  }
}
