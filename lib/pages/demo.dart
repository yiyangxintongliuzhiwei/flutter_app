import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你来到美好人间';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('美好人间'),
          ),
          body: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '类型',
                      helperText: '请输入你喜欢的类型'),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,
                  child: Text('选择完毕'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )),
    );
  }

  void _choiceAction() {
    // getHttp().then((res) => {print(res)});
    print('开始选择你喜欢的类型............');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('类型不能为空')));
    } else {
      getHttp().then((res) {
        setState(() {
          // showText = res.data['name'];
          print(res);
        });
      });
    }
  }

  Future getHttp() async {
    try {
      Response response;
      response = await Dio().post("http://10.0.31.111:8088/234",
          data: {"id": 1, "name": 'zhangsan'});
      return response;
    } catch (e) {
      return print(e);
    }
  }
}
