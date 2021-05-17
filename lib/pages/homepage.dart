import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgs = [
    'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/167682/31/3445/292070/60078490Ee24a36fb/19fdfbe5ecb05ef5.jpg!cr_1125x445_0_171!q70.jpg.dpg',
    'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/115456/40/7331/100669/5ec3a9c6E3dcbadb7/46071c04455c0d5b.jpg!q70.jpg.dpg',
    'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/162098/35/3370/185419/6006563cE4db863fa/7f0d6ea389a21958.jpg!q70.jpg.dpg',
    'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/160590/22/3581/236472/6006c513E69fc93dd/c9dece0338cf8587.jpg!cr_1125x445_0_171!q70.jpg.dpg'
  ];
  List<Map> navigatorList = [
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
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/116602/7/11200/3796/5efbf375Ebba41029/f07cc166f368fa05.png',
      "mallCategoryName": '服务到家'
    },
    {
      "image":
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/146390/3/1846/4909/5efbf39aEe5f5f797/300071558a9ab078.png',
      "mallCategoryName": '钱包卡券'
    },
    {
      "image":
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/150351/19/14167/6853/5fed882dE195ef673/b2aa7d67e675baf8.png',
      "mallCategoryName": '牛年大吉'
    },
    {
      "image":
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/113589/24/11332/4897/5efbf3feE705d87db/e5c12d5e943266b9.png',
      "mallCategoryName": '领取优惠'
    },
    {
      "image":
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/131663/33/3380/3674/5efbf50fEf79cf314/af4b57d2383e605d.png',
      "mallCategoryName": '金钱诱惑'
    },
    {
      "image":
          'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/123730/37/5924/4189/5efbf567E0a226121/d04df7c74c87cf68.png',
      "mallCategoryName": '会员中心'
    }
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('我的APP'),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(333),
            width: ScreenUtil().setWidth(750),
            // height: 250,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  imgs[index],
                  fit: BoxFit.cover,
                );
              },
              autoplay: true,
              itemCount: imgs.length,
              pagination: new SwiperPagination(), //如果不填则不显示指示点
              // control: new SwiperControl(), //如果不填则不显示左右按钮
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(320),
            padding: EdgeInsets.all(3.0),
            child: GridView.count(
              crossAxisCount: 5,
              padding: EdgeInsets.all(4.0),
              children: navigatorList.map((item) {
                return InkWell(
                  // onTap: () {
                  //   print('点击了导航');
                  // },
                  child: Column(
                    children: <Widget>[
                      Image.network(item['image'],
                          width: ScreenUtil().setWidth(95)),
                      Text(item['mallCategoryName'])
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ]));
  }
}
