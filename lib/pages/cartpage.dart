// import 'package:flutter/material.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Text('购物车页面'),
//     ));
//   }
// }

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  final PageController _pageController = new PageController();
  double _currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) => NotificationListener(
          onNotification: (ScrollNotification note) {
            setState(() {
              _currentPage = _pageController.page;
            });
          },
          child: PageView.custom(
            physics:
                const PageScrollPhysics(parent: const BouncingScrollPhysics()),
            controller: _pageController,
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => _SimplePage(
                '$index',
                parallaxOffset:
                    constraints.maxWidth / 2.0 * (index - _currentPage),
                // 小字 Text 在页面滑动时要比整体移动速度快一倍，所以小字的 translate X 为 \tt{pageWidth / 2 * progress} 。
              ),
              childCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  _SimplePage(this.data, {Key key, this.parallaxOffset = 0.0})
      : super(key: key);

  final String data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) => new Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  data,
                  style: const TextStyle(fontSize: 60.0, color: Colors.white),
                ),
                new SizedBox(height: 40.0),
                new Transform(
                  transform:
                      new Matrix4.translationValues(parallaxOffset, 0.0, 0.0),
                  child: const Text(
                    '左右滑动，这是第二行滚动速度更快的小字',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
