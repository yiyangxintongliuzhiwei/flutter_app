import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Matters extends StatefulWidget {
  @override
  _MattersState createState() => _MattersState();
}

List imgs = [];
List navigatorList = [];
List navigatorList1 = [];

class _MattersState extends State<Matters> {
  @override
  void initState() {
    super.initState();
    this.getSwiperImg();
    this.getHttp();
    this.getnavigatorList();
  }

  // 首页按钮
  Future getHttp() async {
    try {
      Response response;
      response = await Dio().get("http://10.0.31.111:8088/getBannerList");
      setState(() {
        print(jsonDecode(response.data['data']));
        print(navigatorList);
        navigatorList = jsonDecode(response.data['data']);
      });
    } catch (e) {
      return print(e);
    }
  }

  // 首页第二页按钮
  Future getnavigatorList() async {
    try {
      Response response;
      response = await Dio().get("http://10.0.31.111:8088/getBannerListtwo");
      setState(() {
        print(jsonDecode(response.data['data']));
        print(navigatorList1);
        navigatorList1 = jsonDecode(response.data['data']);
      });
    } catch (e) {
      return print(e);
    }
  }

  // 三个轮播图
  Future getSwiperImg() async {
    try {
      Response response;
      response = await Dio().get("http://10.0.31.111:8088/getSwiperImgs");
      setState(() {
        print(response.data);
        imgs = jsonDecode(response.data['data']);
        // print(this.imgs);
      });
    } catch (e) {
      return print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('华宝智投'),
        ),
        body: Detail());
  }
}

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final List tabBodies = [GridViews(), GridViews1()];
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          height: ScreenUtil().setHeight(550),
          width: ScreenUtil().setWidth(750),
          margin: EdgeInsets.only(top: 20.0),
          child: new Swiper(
              key: UniqueKey(),
              itemBuilder: (BuildContext context, int index) {
                return tabBodies[index];
              },
              autoplay: true,
              itemCount: tabBodies.length,
              pagination:
                  new SwiperPagination(margin: const EdgeInsets.all(0.0)))),
      Container(
        child: SwiperImg(),
      ),
      Container(
        child: Recommend(),
      )
    ]);
  }
}

// 下方轮播
class SwiperImg extends StatefulWidget {
  @override
  _SwiperImgState createState() => _SwiperImgState();
}

class _SwiperImgState extends State<SwiperImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(190),
      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: new Swiper(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imgs[index]['imgUrl'],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: imgs.length,
          pagination: new SwiperPagination(margin: const EdgeInsets.all(0.0))),
    );
  }
}

class GridViews extends StatefulWidget {
  @override
  _GridViewsState createState() => _GridViewsState();
}

class GridViews1 extends StatefulWidget {
  @override
  _GridViews1State createState() => _GridViews1State();
}

class _GridViewsState extends State<GridViews> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: ScreenUtil().setHeight(320),
        // padding: EdgeInsets.all(3.0),
        child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      // padding: EdgeInsets.all(4.0),
      children: navigatorList.map((item) {
        return InkWell(
          // onTap: () {
          //   print('点击了导航');
          // },
          child: Column(
            children: <Widget>[
              Image.network(item['image'], width: ScreenUtil().setWidth(95)),
              Text(item['mallCategoryName'])
            ],
          ),
        );
      }).toList(),
    ));
  }
}

class _GridViews1State extends State<GridViews1> {
  @override
  Widget build(BuildContext context) {
    /* List<Map> navigatorList1 = [
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
        "mallCategoryName": '会员'
      }
    ]; */
    return Container(
        // height: ScreenUtil().setHeight(320),
        // padding: EdgeInsets.all(3.0),
        child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      // padding: EdgeInsets.all(4.0),
      children: navigatorList1.map((item) {
        return InkWell(
          // onTap: () {
          //   print('点击了导航');
          // },
          child: Column(
            children: <Widget>[
              Image.network(item['image'], width: ScreenUtil().setWidth(95)),
              Text(item['mallCategoryName'])
            ],
          ),
        );
      }).toList(),
    ));
  }
}

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(
        color: Color(0xffF4F4F4),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                '华宝现金宝A',
                style: TextStyle(
                    color: Color(0xff2f2f2f),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                '2.838',
                                style: TextStyle(
                                    color: Color(0xffce3533),
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    color: Color(0xffce3533), fontSize: 18.0),
                              )
                            ],
                          ),
                          Text(
                            '七日年化收益',
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                '2.838',
                                style: TextStyle(
                                    color: Color(0xffce3533),
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    color: Color(0xffce3533), fontSize: 18.0),
                              )
                            ],
                          ),
                          Text(
                            '七日年化收益',
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: 190.0,
                height: 30.0,
                child: FlatButton(
                    padding: EdgeInsets.all(0),
                    color: Color(0xffce3533),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    highlightColor: Color(0xffce3533),
                    child: Text(
                      '立即购买',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ));
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '精品推荐',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: card,
            ),
            Container(
                margin: EdgeInsets.only(top: 15.0),
                height: 270.0,
                child: RecmList())
          ],
        ));
  }
}

class RecmList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 103.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3.60%',
                            style: TextStyle(
                                color: Color(0xffce3533), fontSize: 22.0),
                          ),
                          Text(
                            '预期年化收益',
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '红利390号',
                            style: TextStyle(
                                color: Color(0xff2f2f2f), fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              Text(
                                '91天',
                                style: TextStyle(
                                    color: Color(0xffce3533), fontSize: 15.0),
                              ),
                              Text(
                                '期 | ',
                                style: TextStyle(
                                    color: Color(0xff666666), fontSize: 15.0),
                              ),
                              Text(
                                '5万',
                                style: TextStyle(
                                    color: Color(0xffce3533), fontSize: 15.0),
                              ),
                              Text(
                                '起购',
                                style: TextStyle(
                                    color: Color(0xff666666), fontSize: 15.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 75.0,
                      height: 30.0,
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          color: Color(0xffce3533),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0))),
                          highlightColor: Color(0xffce3533),
                          child: Text(
                            '立即购买',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xffe4e4e4),
              )
            ],
          ),
        );
      },
    );
  }
}
