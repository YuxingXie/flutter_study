import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MyForm();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'result',
            builder: (BuildContext context, GoRouterState state) {
              return ResultScreen();
            },
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final t1Controller = TextEditingController();
  final t2Controller = TextEditingController();
  String? userName;
  String? pwd;
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                context.go('/result');
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
    );
  }
}

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in result Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Sign in screen'),
        ),
      ),
    );
  }
}
