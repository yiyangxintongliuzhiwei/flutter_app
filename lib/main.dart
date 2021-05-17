import 'package:flutter/material.dart';
// import './pages/IndexPage.dart';
import './views/Index_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        // title: '这是我的应用',
        home: IndexPage(),
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors.pink),
      ),
    );
  }
}
