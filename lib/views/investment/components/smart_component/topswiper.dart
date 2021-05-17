import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Topswiper extends StatefulWidget {
  @override
  _TopswiperState createState() => _TopswiperState();
}

List imgs = [
  'https://s.touker.com/fs/images/c2bc1875-ea1c-43be-86dd-a535fddfaee8',
  'https://s.touker.com/fs/images/6ca02d35-71b6-444e-8591-235ea237e892',
  'https://s.touker.com/fs/images/bf25937e-4560-488f-9484-a8886ffb7da6'
];

class _TopswiperState extends State<Topswiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(160),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      margin: EdgeInsets.only(top: 15),
      child: new Swiper(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imgs[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: imgs.length,
          pagination: new SwiperPagination(
            margin: const EdgeInsets.all(0.0),
          )),
    );
  }
}
