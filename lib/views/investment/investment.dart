import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/colors_util.dart';
import './components/robot.dart';
import './components/school.dart';
import './components/smart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Investment extends StatefulWidget {
  @override
  _InvestmentState createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: ColorUtil.fromHex('#E4E4E4'),
          elevation: 0.0,
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
          bottom: TabBar(
            controller: _controller,
            unselectedLabelColor: ColorUtil.fromHex('#2F2F2F'), // 未选中字体颜色
            unselectedLabelStyle: TextStyle(fontSize: 20), // 未选中字体大小
            labelColor: Colors.black, // 选中颜色
            labelStyle: TextStyle(fontSize: 20), // 选中字体
            indicatorColor: Colors.black, // 下划线颜色
            indicatorSize: TabBarIndicatorSize.label, // 下划线长度
            indicatorWeight: 3.0, // 下划线高度
            tabs: [
              Tab(
                text: '智投',
              ),
              Tab(
                text: '机器人',
              ),
              Tab(
                text: '学堂',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[Smart(), Robot(), School()],
        ));
  }
}
