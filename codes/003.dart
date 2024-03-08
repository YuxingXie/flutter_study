import 'package:flutter/material.dart';

void main() {
  print('app will start');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  bool showErr = false; //是否显示错误信息

  @override
  State<MyApp> createState() => MyFormBtnState();
}

class MyFormBtnState extends State<MyApp> {
  final t1Controller = TextEditingController();
  final t2Controller = TextEditingController();
  String? userName;
  String? pwd;
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          TextField(
            controller: t1Controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '用户名',
            ),
          ),
          TextField(
              controller: t2Controller,
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '密码',
              )),
          ElevatedButton(
              onPressed: () {
                // setState(() {
                userName = t1Controller.text;
                pwd = t2Controller.text;
                if (userName == 'admin' && pwd == '123') {
                  msg = '登录成功！';
                } else {
                  msg = '用户名密码/错误！';
                }
                print('用户名：${t1Controller.text},密码：${t2Controller.text}');
                // });
                setState(() {});
              },
              child: Text('登录')),
          Text(msg)
        ]),
      ),
    );
  }
}
