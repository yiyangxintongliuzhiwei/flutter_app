import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/colors_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './market/market.dart';
import './trade/trade.dart';
import './investment/investment.dart';
import './matters/matters.dart';
import './mine/mine.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('行情')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('交易')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('智投')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('理财')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('我的')),
  ];
  final List tabBodies = [Market(), Trade(), Investment(), Matters(), Mine()];
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: new AppBar(
        backgroundColor: ColorUtil.fromHex('#E4E4E4'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                CupertinoIcons.search,
                size: 32,
              ),
              tooltip: '搜索',
              onPressed: null),
          IconButton(
              icon: Icon(CupertinoIcons.barcode_viewfinder, size: 32),
              tooltip: '扫码',
              onPressed: null),
          IconButton(
              icon: Icon(CupertinoIcons.ellipses_bubble, size: 32),
              tooltip: '消息',
              onPressed: null),
          //标题右侧按钮
        ],
      ), */
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
