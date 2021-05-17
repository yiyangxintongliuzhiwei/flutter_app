import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors_util.dart';

class CustomTabBarView extends StatefulWidget {
  @override
  _CustomTabBarViewState createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView>
    with SingleTickerProviderStateMixin {
  final tabs = ['推荐', '要闻'];
  final tabBodies = [Inteview(), News()];
  TabController _tabController;
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    currentPage = tabBodies[currentIndex];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: _buildTabBar(),
          ),
          Container(color: Colors.grey, child: currentPage)
        ],
      ),
    );
  }

  // 切换tab
  Widget _buildTabBar() => TabBar(
        // tab相关配置
        onTap: (index) => {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          })
        },
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.black,
        indicatorWeight: 3,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        tabs: tabs.map((e) => Tab(text: e)).toList(),
      );

  /*  Widget _buildTableBarView() =>
      TabBarView(controller: _tabController, children: <Widget>[
        Inteview(),
        News(),
      ]); */
}

// 推荐
class Inteview extends StatefulWidget {
  @override
  _InteviewState createState() => _InteviewState();
}

class _InteviewState extends State<Inteview> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(705),
        height: ScreenUtil().setHeight(329),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(329),
                    height: ScreenUtil().setHeight(183),
                    color: ColorUtil.fromHex('#c1c1c1'),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(329),
                    height: ScreenUtil().setHeight(183),
                    color: ColorUtil.fromHex('#c1c1c1'),
                  )
                ],
              ),
            ),
            Container(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(88),
                padding: EdgeInsets.only(top: 0, left: 8, right: 8),
                child: Teacher())
          ],
        ));
  }
}

// teacher
class Teacher extends StatelessWidget {
  final data = [
    {'name': '虞伟', 'pickname': '核心资产', 'moment': '55.4%'},
    {'name': '金晓明', 'pickname': '金林山一号', 'moment': '61.75%'},
    {'name': '刘Sir', 'pickname': '理财顾问', 'moment': '88.66%'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(88),
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        reverse: false,
        crossAxisCount: 1,
        mainAxisSpacing: 6,
        childAspectRatio: 0.314,
        children: data.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Container _buildItem(item) => Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(88),
        color: ColorUtil.fromHex('#FFFFFF'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: ScreenUtil().setHeight(58),
              width: ScreenUtil().setWidth(58),
              margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5),
              decoration: new BoxDecoration(
                  color: ColorUtil.fromHex('#d8d8d8'),
                  borderRadius: new BorderRadius.circular((58.0))),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item['name'] + ' | ' + item['pickname'],
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        color: ColorUtil.fromHex('#666666')),
                  ),
                  Text(
                    item['moment'],
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.fromHex('#2F2F2F')),
                  )
                ],
              ),
            )
          ],
        ),
      );
}

// 新闻
class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(705),
      height: ScreenUtil().setHeight(100),
    );
  }
}
