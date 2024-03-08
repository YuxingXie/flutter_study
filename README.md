# flutter_study

主要参考：https://flutter.cn/docs

Flutter油管频道：https://www.youtube.com/playlist?list=PLjxrf2q8roU3wk7CDw4RfV3mEwOJbjx1k

IDE使用的VSCode，我的intellij IDEA版本2020太低，连dart代码自动补全都没有。

安装、环境配置什么的都不搞了，依葫芦画瓢的东西没啥说的，直奔主题。

## 第一章 Widget

根据Flutter油管频道的指示，我下载了第一份可运行的源码： https://goo.gle/3mKYe5P 。在本项目里，我放在了codes/001.dart中。大家可以看一下代码，Flutter程序就是由一个个Widget像搭积木一样搭起来的。所以Widget就是我们需要了解的第一个东西。

* Widgets 是用于构建 UI 的类。

* Widgets 可以用于布局和展示 UI 元素。

* 通过组合简单的 widgets 来构建复杂的 widgets。

Widget的API: https://api.flutter-io.cn/flutter/widgets/widgets-library.html

Flutter 布局的核心机制是 widget。在 Flutter 中，几乎所有东西都是 widget —— 甚至布局模型都是 widget。你在 Flutter 应用程序中看到的图像，图标和文本都是 widget。此外不能直接看到的也是 widget，例如用来排列、限制和对齐可见 widget 的行、列和网格。



### 1.1 布局widget

先来这里 https://flutter.cn/docs/ui/widgets/layout 看看Flutter为我们提供了那些核心的布局Widget。
可以看到总共有42个布局Widgets，被分为三组：

* Single-child layout widgets
* Multi-child layout widgets
* Sliver widgets

根据文档教程，我们需要选择一个叫Center的Widget来编写一个简单程序,我们发现它在Single-child layout widgets分组中。
从分组的名字看，大概意思是这个布局只能有一个子Widget吧。它自己的名字Center也表明了这个布局Widget大概是用来是让UI居中布局的。

### 1.2 其它widget

除了布局Widget外，其它肯定应该要包括UI Widget吧，至于还有没有其它类型的Widgets目前不清楚,也没必要现在就搞清楚。

怎么查询自己想要用的Widget呢，下面是文档地址：

* 所有Widgets: https://flutter.cn/docs/reference/widgets
* 分组Widgets: https://flutter.cn/docs/ui/widgets




原本想跟着文档示例一步步操作，搭建一个页面，初步了解一下具体的各种Widgets，结果发现文档的实例代码根本只有片段，
而且还很跳跃，跟dart文档一样。比如MaterialApp、CupertinoApp、Scaffold等这些Widgets没有前置就直接蹦出来了。

我不想放弃文档的提纲，它可以让我清楚自己的学习路径，不过文档的内容得自己找资料去研究了。

### 1.3 MaterialApp

它是一个Widget，可以作为最顶层的Widget存在，即程序入口main函数中运行的runApp方法传入的那个参数。
```dart
import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp());
}

```
上面这段代码可以运行，程序会弹出一个黑框。实际上把MaterialApp换成Text这种Widget程序也会运行，只不过没有窗口，
如果是windows下运行，可以在任务管理器中看到它并可以结束这个任务。

我们到MaterialApp的API文档初略看看它到底是有什么用： https://api.flutter-io.cn/flutter/material/MaterialApp-class.html

第一次仔细看一个Widget的内部说实在的还挺纷繁复杂的。不过这个MaterialApp的两个命名参数引起了我的注意，即home和routes。
这让我立即想到了angular中的component和module，module也有一系列路由匹配不同的components,一个component就是一个页面,而且一个module也有一个home页，表示进入模块的默认位置。
这样对比一想，Widget的概念就清晰了一些，Widget可以是类似angular模块，表示一系列相关页面，也可以是一个页面，也可以是页面上的一个按钮或组件或者其它组成部分。

我试着在上面的例子中把home设为一个Text，程序显示了文字：
```dart
  runApp(const MaterialApp(
    home: Text('this is the body of a scaffold.'),
  ));
```

### 1.4 Scaffold

前面说了Wideget可以是一个页面，通过阅读一些API代码，我认为Scaffold代表某一种页面。试着在runApp中直接传入一个Scaffold程序不出现窗口，把它放在一个MaterialApp中就能显示了：
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text('this is the body of a scaffold.')),
    ),
  ));
}

```

前面无论是在runApp函数中传入Text还是Scaffold，都不能被渲染。当它们放入MaterialApp后，都能被渲染。
是不是可以认为，MaterialApp类似于一种容器，不放在容器中的Widget无法渲染？

Widget是在太多太杂了，我想在学习阶段一个个弄明白实在是没必要，最多再了解一下表单输入相关的Widgets，
但也是碰到了案例再来学也不迟。对整套框架形成整体认识才是更重要的是，
比如数据的传递，路由，前后端通信等还有很多可以想象得到的内容需要了解。所以这一章就先不做过多深入了。



## 第二章 主题

此章留白先

## 第三章 交互


### 3.1 有状态和无状态的 widgets

无状态的 widget 自身无法改变。 Icon、IconButton 和 Text 都是无状态 widget，它们都是 StatelessWidget 的子类。

有状态的 widget 自身是可动态改变的（基于State）。例如，可以通过与用户的交互或是随着数据的改变而导致外观形态的变化。 Checkbox、Radio、Slider、 InkWell、Form 和 TextField 都是有状态 widget，它们都是 StatefulWidget 的子类。

一个 widget 的状态保存在一个 State 对象中，它和 widget 的显示分离。 Widget 的状态是一些可以更改的值，如一个滑动条的当前值或一个复选框是否被选中。当 widget 状态改变时，State 对象调用 setState()，告诉框架去重绘 widget。

上面这几段话都是教程里的原文。https://flutter.cn/docs/ui/interactivity#step-2

当我试图按照它的步骤指引去阅读时，发现它的例子不但不能运行，也晦涩难懂。于是我找到了油管视频：
https://www.youtube.com/watch?v=QlwiL_yLh6E&list=PLjxrf2q8roU3wk7CDw4RfV3mEwOJbjx1k&index=7

#### 3.1.1 编写一个登录表单

在他的留言区顶部找到源码地址，是能运行的，而且很好理解。我看了他的视频，他把Widget比喻成大蛋糕的一个个小部件，
dart程序就按照食谱一步步做出一个完整的大蛋糕。不过他的代码示例是如何使用一个多选框。

你可以去他的视频下下载源码，也可以在我这里找到，codes/002.dart就是。我不想照抄他的代码，但是我先自己阅读了他的代码，
然后自己构思一个登录表单，用户界面上有用户名和密码两个输入框和一个登录按钮，点击登录按钮后如果用户名密码错误则显示一段提示。

先清空自己的main.dart，我们重新写。参考他的代码，我先写一个传入runApp的类MyApp,它的是继承自StatelessWidget,我的也是。
编译器要求我实现StatelessWidget.build方法，我先把空方法写上：

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

```
api告诉我们build方法就是我们要放入用户界面的小部件，对我来说就是放入一个表单。
 接下来我需要在Widgets目录下的Input widgets分组里找到了Form,FormField这两个我可能需要的Widget,
 然而它们并不是，我需要的是Material Components widgets分组下的TextField。
 另外按钮ElevatedButton在Basic Widgets分组下。

 另外runApp只接收一个Widget而我需要使用多个Widget，所以我肯定需要一个容器Widget来容纳多个Widget，
 我使用的就是前面的MaterialApp和Scaffold,并按照油管的示例在一个Column中放入多个children。
尝试代码如下：
 ```dart
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Column(children: [
        TextField(),
        ElevatedButton(onPressed: null, child: null),
      ]),
    );
  }
 ```
 程序编译没问题，运行的时候VSCode提示“Main isolate is paused in debugger”，暂停执行了，我点击Resume继续执行，
 程序展示了一个带错误信息的渲染页面，上面是错误信息，我截图在documents/001.PNG。我稍微翻译了一下：
 ```text
没有找到材料部件。TextField小部件需要在最近的LookupBoundary内有一个材料小部件祖先。
在材料设计中，大多数部件在概念上“打印”在片状材料上。
在Flutter的材质库中，该材质由材质小部件表示。
例如，它是渲染墨水飞溅的材料部件。
正因为如此，许多材质库部件需要在它们上面的树中有一个材质部件。
要引入一个Material小部件，您可以直接包含一个，也可以使用包含Material本身的小部件，例如Card、Dialog、Drawer或Scaffold。
 ```
 原来是TextField需要一个容器包含它，而且提示也告诉我们用Card、Dialog、Drawer或Scaffold这些可以当做容器，
 那么我就用Scaffold吧。改改代码：
 ```dart
   Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(children: [
          TextField(),
          ElevatedButton(onPressed: null, child: null),
        ]),
      ),
    );
  }
 ```
终于，文本框和按钮出来了。

先给输入框装饰一下。TextField有一个命名参数decoration,用来装饰输入框的，在文档中找到示例：
```dart
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: '用户名',
  )
```
把它放到TextField的参数中，有效。

按钮加文字更简单了，给它一个child：
```dart
child:Text('登录')
```
可以工作，现在依样画葫芦加一个密码框。稍微研究下TextField API,发现密码需要在TextField中加入两个命名参数：
```dart
              obscureText: true,//这个设为true就会在输入时进行遮掩
              obscuringCharacter: '•',//遮掩字符，这个是默认值，可以改为你想要的比如"*"
```
最后再加一个Text，用来在点击按钮后显示‘用户名/密码错误！’。不过现在不要显示任何文字：
```dart
  Text('')
```

还想更美化？不了，这不是我们现在的重点。不过想研究的话可以去InputDecoration看看有什么可以定义的。


#### 3.1.2 让按钮响应点击事件

现在我们有一个简陋的登录界面，不过它不会对你的点击做出反应。根据油管教学视频，

我们要定义一个传入ElevatedButton的onPressed的参数，阅读API得知它是一个VoidCallback类型，而VoidCallback是一个类型的别名，
它表示没有参数，没有返回值的函数：
```dart
  typedef VoidCallback = void Function();
```
现在改写代码：
```dart
  //error
  ElevatedButton(onPressed: () {}, child: Text('登录')),
```
出现了错误：Invalid constant value.dart(invalid_constant)，把return const MaterialApp这句中的const去掉就好了。

现在发现，原来灰色的按钮变颜色了，而且鼠标移上去有交互反应。看API知道原来onPressed为null的时候按钮是disabled的。

现在我按照自己的逻辑改写了MyApp，好让我点击按钮的时候，改变最后一个Text的文本为“用户名密码/错误”，现在MyApp代码如下：
```dart
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
          ElevatedButton(
              //onPressed设计本意是让showErr值切换
              onPressed: () => showErr = !showErr,
              child: Text('登录')),

          Text(showErr ? '用户名密码/错误' : '') //设计本意是让它根据showErr显示不同的文字
        ]),
      ),
    );
  }
}
```
按钮点击后啥都没发生，不过我早有心理准备，因为我知道一个概念叫State,Flutter的状态改变都要用这个东西。
那么我看了看别人的代码是如何写的,然后改写我的代码：
```dart
  onPressed: () => setState(() =>showErr = !showErr),
```
然而报错The method 'setState' isn't defined for the type 'MyApp'.不过这是可以理解的，
setState方法是StatefulWidget定义的抽象方法，而我直接传入了ElevatedButton,它并不是一个StatefulWidget，
我需要把按钮拿出来自己单独定义为StatefulWidget,我参照油管视频操作如下：

先定义一个MyFormBtn的类继承StateFulWidget:
```dart
class MyFormBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}```
我们需要重写createState方法,上面IDE帮我自动生成的createState方法的返回值换为State<MyFormBtn>,这种类型的类需要我们自己定义。

重写createState并定义State<MyFormBtn>类型的MyFormBtnState类：
```dart
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
        onPressed: () => setState(() => showErr = !showErr),
        child: Text('登录'));
  }
}
```
把MyApp中原来传入ElevatedButton的地方改为传入MyFormBtn：
```dart
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
```
不出意外的话，我猜会出意外。因为我显示错误信息的Text是这样写的：
```dart
Text(showErr ? '用户名密码/错误' : '')
```
它并没有从setState函数有任何关联，它只是在初始化时根据showErr的值传入了一个空字符串，并没有在我点击按钮后做出响应。

#### 3.1.3 显示登录错误信息

实际上上面的代码不能运行，是因为我对State的理解是错误的。并不是我让按钮变为有状态的，按钮和消息Text就可以共享状态变化，
即showErr这个变量的变化。它只是让showErr在按钮内部(比如显示按钮文字的Text是可以用showErr控制)，
而不会让和它平行的这个显示错误信息的Text共享showErr的变化。

现在问题就好办了，我们稍加改变代码即可，让MyApp变为StatefullWidget，这样整个App都能共享变量(不过在实际项目中应该是不推荐的)：
```dart
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
  bool showErr = false;

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
          ElevatedButton(
              onPressed: () {
                showErr = !showErr;
                print('$showErr');
                setState(() => showErr = showErr);
              },
              child: Text('登录')),
          Text(showErr ? '用户名密码/错误' : '')
        ]),
      ),
    );
  }

  printMsg() {
    showErr = !showErr;
    print('$showErr');
  }
}

```

#### 3.1.4 实现登录逻辑判断

现在还有一个问题，我们要获取两个文本框的值。如何获取文本框的值，官方文档在这里： https://flutter.cn/docs/cookbook/forms/retrieve-input

现在我们按步骤操作。

第一步:MyFormBtnState中为两个文本框定义两个TextEditingController,并分别传入TextField的命名参数controller中：
```dart
class MyFormBtnState extends State<MyApp> {
  bool showErr = false;
  final t1Controller = TextEditingController();
  final t2Controller = TextEditingController();
  //other codes....
  TextField(
            controller: t1Controller,
            //other codes...
            ),
          ),
  TextField(
      controller: t2Controller,
      //other codes...
      ),
      //other codes...
}
```
第二步：通过获得文本框值
```dart
print('用户名：${t1Controller.text},密码：${t2Controller.text}');
```

现在我们实现登录逻辑，当用户名为admin,密码为123时验证通过，否则显示错误。
```dart
 onPressed: () {
                //userName,pwd,msg都是定义在MyFormBtnState中的3个实例变量，定义的代码就不写出来了
                userName = t1Controller.text;
                pwd = t2Controller.text;
                if (userName == 'admin' && pwd == '123') {
                  msg = '登录成功！';
                } else {
                  msg = '用户名密码/错误！';
                }
                setState(() {});
              },
```
把逻辑写在setState函数体内也是可以的：

```dart
setState(() {
  userName = t1Controller.text;
    pwd = t2Controller.text;
    if (userName == 'admin' && pwd == '123') {
      msg = '登录成功！';
    } else {
      msg = '用户名密码/错误！';
    }
});
```
setState本质上是通知框架该对象的内部状态发生了变化（API:Notify the framework that the internal state of this object has changed.）。

现在似乎基本完成了，也说明了有状态Widget是什么东西，如何共享状态等内容，保存代码在codes/003.dart供参考。

跟UI相关的Widget就讲到这里，既然入门了，我想需要的时候自行研究，慢慢积累。

## 第四章 导航 & 路由

Flutter的中文文档除了目录可以借鉴外，我感觉啥都没用。我还是自己找资料吧。还是在Flutter的油管频道找到了一个关于go_router的视频：
https://www.youtube.com/watch?v=b6Z885Z46cU ，在它的留言区上方找到了视频推荐的网站pub.dev，并在里面找到了go_router的入门用法：
https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html

go_router包并不在核心包中，需要安装，terminal运行如下命令：
```text
  flutter pub add go_router
```
安装后可在pubspec.yaml中看到。

根据视频提供的源码：https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/main.dart ，
我大幅度修改了我的代码结构以实现路由功能。

首先，MyApp这个类就不能提供任何UI widgets了，因为它现在需要作为提供路由的顶层Widget，我把MyApp改写如下：
```dart
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

```
这是部分代码，你照我的拷贝后报错是正常的，我会慢慢完善它。先解释下有哪些变化，有什么玄机。

首先，MyApp由StatefulWidget变成了StatelessWidget。作为管理路由的Widget，它并不需要状态。
现在MyApp中没有UI部件了。

其次，MyApp仍然是一个MaterialApp，MaterialApp既可以容纳视图，也可以容纳路由。

接下来，登录的输入框和按钮这个页面我移到了MyForm这个新类中，它需要是有状态的，用来保存和更新组件状态的改变，就和之前一样。

```dart

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
```
这里除了把原来MyApp的UI小部件都移到了MyForm和MyFormState中之外，它的UI最外层不再是MaterialApp了，而是Scaffold。
作为最外层的MyApp包含了一个MaterialApp，在路由控制之内的小部件都被包含在这个MaterialApp内，所以其它小部件不再需要MaterialApp包裹。

在按钮点击事件onPressed函数中，我加入了一句
```dart
  context.go('/result');
```
当这句代码执行时，程序根据路由"/result"去匹配配置中builder对应的Widget即ResultScreen，然后跳转过去。
下面是ResultScreen，我基本照抄了示例的代码，所以看上去比我写的页面漂亮多了：
```dart
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
```
这个类是无状态的，无状态的类比有状态的写起来简单一些。同样它的顶层也是Scaffold。

最终代码保存在codes/004.dart。
