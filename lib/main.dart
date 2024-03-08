import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  print('app will start');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool showErr = false; //是否显示错误信息
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '用户名',
          )),
          TextField(
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '密码',
              )),
          MyFormBtn(),
          Text(showErr ? '用户名密码/错误' : '') //设计本意是让它根据showErr显示不同的文字
        ]),
      ),
    );
  }
}

class MyFormBtn extends StatefulWidget {
  @override
  State<MyFormBtn> createState() => MyFormBtnState();
}

class MyFormBtnState extends State<MyFormBtn> {
  bool showErr = false; //这个变量从MyApp搬倒了这里，记得把MyApp中的这个变量去掉

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        //现在代码OK
        onPressed: () => setState(() => printMsg),
        //  onPressed: () => setState(() => showErr = !showErr),
        child: Text('登录'));
  }

  printMsg() {
    showErr = !showErr;
    print('$showErr');
  }
}
