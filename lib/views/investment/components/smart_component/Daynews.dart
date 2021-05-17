import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors_util.dart';

class Daynews extends StatelessWidget {
  final redBox = Container(
    // color: Colors.red,
    width: ScreenUtil().setWidth(750),
    height: ScreenUtil().setHeight(52),
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          height: ScreenUtil().setHeight(52),
          width: ScreenUtil().setWidth(52),
          margin: EdgeInsets.only(top: 0, left: 0, right: 7, bottom: 0),
          decoration: new BoxDecoration(
              color: ColorUtil.fromHex('#999999'),
              borderRadius: new BorderRadius.circular((52))),
        ),
        Text(
          '我是发布人',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: ColorUtil.fromHex('#999999')),
        )
      ],
    ),
  );

  final blueBox = Container(
    // color: Colors.blue,
    width: ScreenUtil().setWidth(750),
    height: ScreenUtil().setHeight(66),
    child: Text('文本信息标题文本信息标题文本信息标题文本信息标题文本信息标题文本信息标',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            color: ColorUtil.fromHex('#2F2F2F'))),
  );

  final greenBox = Container(
    // color: Colors.yellow,
    width: ScreenUtil().setWidth(750),
    height: ScreenUtil().setHeight(234),
    margin: EdgeInsets.only(top: 5),
    child: new Image.network(
      'https://s.touker.com/fs/images/bf25937e-4560-488f-9484-a8886ffb7da6',
      fit: BoxFit.cover,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(411),
          padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 10),
          margin: EdgeInsets.only(top: 14),
          decoration: new BoxDecoration(
            border: new Border.all(
                //边框颜色
                color: ColorUtil.fromHex('#E4E4E4'),
                //边框宽度
                width: 0.5),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[redBox, blueBox, greenBox],
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(411),
          padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 10),
          margin: EdgeInsets.only(top: 14),
          decoration: new BoxDecoration(
            border: new Border.all(
                //边框颜色
                color: ColorUtil.fromHex('#E4E4E4'),
                //边框宽度
                width: 0.5),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[redBox, blueBox, greenBox],
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(411),
          padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 10),
          margin: EdgeInsets.only(top: 14),
          decoration: new BoxDecoration(
            border: new Border.all(
                //边框颜色
                color: ColorUtil.fromHex('#E4E4E4'),
                //边框宽度
                width: 0.5),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[redBox, blueBox, greenBox],
          ),
        )
      ],
    );
  }
}
