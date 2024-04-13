# flutter_study

> ## 第一章 Widget

> ## 第二章 主题

> ## 第三章 交互

> ## 第四章 导航 & 路由

> ## 第三章 交互

主要参考：https://flutter.cn/docs

Flutter油管频道：https://www.youtube.com/playlist?list=PLjxrf2q8roU3wk7CDw4RfV3mEwOJbjx1k

IDE使用的VSCode，我的intellij IDEA版本2020太低，连dart代码自动补全都没有。

本人第一遍学习以快速入门为主，所以会略过很多非核心章节。然后我会结合一个项目实战进行深入一些的研究，到时候会补充一些内容。

安装、环境配置什么的都不搞了，依葫芦画瓢的东西没啥说的，直奔主题。

## 第一章 Widget

根据Flutter油管频道的指示，我下载了第一份可运行的源码： https://goo.gle/3mKYe5P 。在本项目里，我放在了codes/001.dart中。大家可以看一下代码，Flutter程序就是由一个个Widget像搭积木一样搭起来的。所以Widget就是我们需要了解的第一个东西。

* Widgets 是用于构建 UI 的类。

* Widgets 可以用于布局和展示 UI 元素。

* 通过组合简单的 widgets 来构建复杂的 widgets。

Widget的API: https://api.flutter-io.cn/flutter/widgets/widgets-library.html

Flutter 布局的核心机制是 widget。在 Flutter 中，几乎所有东西都是 widget —— 甚至布局模型都是 widget。你在 Flutter 应用程序中看到的图像，图标和文本都是 widget。此外不能直接看到的也是 widget，例如用来排列、限制和对齐可见 widget 的行、列和网格。




### 1.1 官方文档文档上介绍的Widgets

#### 1.1.1 布局widget

先来这里 https://flutter.cn/docs/ui/widgets/layout 看看Flutter为我们提供了那些核心的布局Widget。
可以看到总共有42个布局Widgets，被分为三组：

* Single-child layout widgets
* Multi-child layout widgets
* Sliver widgets

根据文档教程，我们需要选择一个叫Center的Widget来编写一个简单程序,我们发现它在Single-child layout widgets分组中。
从分组的名字看，大概意思是这个布局只能有一个子Widget吧。它自己的名字Center也表明了这个布局Widget大概是用来是让UI居中布局的。

#### 1.1.2 其它widget

除了布局Widget外，其它肯定应该要包括UI Widget吧，至于还有没有其它类型的Widgets目前不清楚,也没必要现在就搞清楚。

怎么查询自己想要用的Widget呢，下面是文档地址：

* 所有Widgets: https://flutter.cn/docs/reference/widgets
* 分组Widgets: https://flutter.cn/docs/ui/widgets




原本想跟着文档示例一步步操作，搭建一个页面，初步了解一下具体的各种Widgets，结果发现文档的实例代码根本只有片段，
而且还很跳跃，跟dart文档一样。比如MaterialApp、CupertinoApp、Scaffold等这些Widgets没有前置就直接蹦出来了。

我不想放弃文档的提纲，它可以让我清楚自己的学习路径，不过文档的内容得自己找资料去研究了。

#### 1.1.3 MaterialApp

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

#### 1.1.4 Scaffold

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

有些Widget必须在特定的直接父容器Widget里面，如：

 Widget                      Parent Widget

Expanded()               Row(), Column(), Flex()

Flexible()               Row(), Column(), Flex()

Positioned()                    Stack()

TableCell()                     Table()

### 1.2 官方文档文档上没有的Widgets

#### 1.2.1 InkWell

在Widget继承层次上比较靠前的Widget，支持各种手势触发函数，点击，拖动等等。

#### 1.2.2 Positioned和Stack



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

### 4.1 实现路由

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

### 4.2 传递数据

没太多新意，无非是路由uri parameter传递，构造函数传递，没有理解难度。提供一些示例代码即可：
```dart
GoRoute(
  path: '/users/:userId',
  builder: (context, state) => const UserScreen(id: state.pathParameters['userId']),
),

GoRoute(
  path: '/users',
  builder: (context, state) => const UsersScreen(filter: state.uri.queryParameters['filter']),
),


```
命名路由
```dart
GoRoute(
   name: 'song',
   path: 'songs/:songId',
   builder: /* ... */,
 ),
 TextButton(
  onPressed: () {
    context.goNamed('song', pathParameters: {'songId': 123});
  },
  child: const Text('Go to song 2'),
),
```

路由其实需要注意的点还是不少的，不过我自己也没个头绪该如何研究，deeplink这种和Android IOS相关的概念我暂时也不懂，所以就先搞这些。
大家可以去这里 https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html 学习go_router。

另外，资源、媒体、动画、过渡、设计、主题、无障碍、国际化，以及其它一些个Widget，我会放到最后几个章节，前面的章节先研究核心的内容。


### 4.3 go_router

在经历了一段时间的开发后，我受够了Navigator.push传递参数后，在目标路由上获取到null。可能怪我学艺不精，但是这么一个简单到爆的功能，系统的健壮度可信赖度却如此脆弱，
实在不是一个靠谱的东西，思来想去研究一下go_router。

初略看了一下，go_router和Navigator用法相似，所以用go_router替换Navigator不会对程序结构造成破坏。
看了一下它定义路由的方式，可以使用类似restflul uri方式定义路由，可以带pathParameters和queryParameters，
类似于"user/:id"，"user?id=myId"这种方式，也可以用字符串命名路由。传递简单数据的方式可以通过url路径传递，
复杂点的Object数据用构造函数参数传递。

文档在这里： https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html

有什么领悟或者要填坑，会回来补充。




## 第五章 状态管理

前面介绍了有状态和无状态的Widget，这里本是继续详细讲解状态管理的，不过我打算先跳过去，实在跳不过再回来补习。

但是现在我回来了，说明这个是跳不过去的槛。为什么呢？因为我之前学习到的State管理的状态，在调用setState时会重绘UI，
它是Flutter内置的状态管理。然而在Flutter的官方油管频道，根本提都不提它，而是给大家推出了一个叫Riverpod的东西来进行状态管理。
话不多说，我就来研究下Riverpod，参考资料 https://riverpod.dev/docs/introduction/getting_started


Riverpod是一个庞大的主题，我学了一小会发现不是一时半会能搞明白的，所以放弃了，但是学过的部分先留在这里。Riverpod就不研究了，但是Flutter本身的State管理我们还是要搞明白。

### 5.1 Flutter中的State

现在我要设计一个按钮Widget，要求有几点：

* 它能对点击做出反应;
* 它能传入多个Widget；
* 它传入的Widgets垂直居中。

下面是代码:
```dart
import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  final double? padding;
  const SquareButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.color,
      this.padding});
  @override
  State<StatefulWidget> createState() => SquareButtonState();
}

class SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        container: true,
        child: InkWell(
            onTap: widget.onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.child,
              ],
            )));
  }
}
```
这个类隐藏了状态的奥秘。

#### 5.1.1 从一个错误理解state在flutter中的意义

我写过一个ListView,想用ListView.build命名构造方法的itemBuilder函数的参数值来修改另一个变量的值，以此来在另一个Widget中显示。结果出错了，
出错的地方是在setState方法执行时：

```dart
import 'package:flutter/material.dart';

main() {
  runApp(const PaginatedListView());
}

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({super.key});

  @override
  State<PaginatedListView> createState() => PaginatedListViewState();
}

class PaginatedListViewState extends State<PaginatedListView> {
  final List<String> entries = ['A', 'B', 'C'];
  final List<int> colorCodes = [600, 500, 100];
  var scrollcontroller = ScrollController();
  var message = '';

  bool isLoading = false;

  int page = 0;
  var total = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Pagination View"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: const Center(
              child: Text("message"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: total,
              controller: scrollcontroller,
              itemBuilder: (context, index) {
                return listTile(index);
              },
            ),
          ),
        ],
      ),
    ));
  }

  ListTile listTile(int index) {
    setState(() {
      message = "$index";
    });
    return ListTile(title: Text("Segment : $index"));
  }

  @override
  void initState() {
    //added the pagination function with listener
    scrollcontroller.addListener(pagination);
    super.initState();
  }

//_subCategoryModel only use for check the length of product

  void pagination() {
    if ((scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent)) {
      setState(() {
        isLoading = true;
        page += 1;
        //add api for load the more data according to new page
      });
    }
  }
}

```

错误信息如下，请仔细阅读：
```text
Exception has occurred.
FlutterError (setState() or markNeedsBuild() called during build.
This PaginatedListView widget cannot be marked as needing to build because the framework is already in the process of building widgets. A widget can be marked as needing to be built during the build phase only if one of its ancestors is currently building. This exception is allowed because the framework builds parent widgets before children, which means a dirty descendant will always be built. Otherwise, the framework might not visit this widget during this build phase.
The widget on which setState() or markNeedsBuild() was called was:
  PaginatedListView
The widget which was currently being built when the offending call was made was:
  MediaQuery)
```
翻译：这个PaginatedListView小部件不能被标记为需要构建，因为框架已经在构建小部件的过程中了。只有当一个小部件的祖先当前正在构建时，才能在构建阶段将其标记为需要构建。
这个异常是允许的，因为框架在子部件之前构建父部件，这意味着总是会构建脏的后代部件。否则，框架可能不会在此构建阶段访问此小部件。


### 5.2 why Riverpod?


本节内容纯翻译自https://riverpod.dev/docs/introduction/why_riverpod

Riverpod (Provider的变体)是一个用于Flutter/Dart的响应式缓存框架。

使用声明式和响应式编程，Riverpod为你处理了大部分应用程序的逻辑。它可以使用内置的错误处理和缓存来执行网络请求，同时在必要时自动重新获取数据。

现代应用程序很少提供呈现其用户界面所需的所有信息。相反，数据通常是从服务器异步获取的。
问题是，处理异步代码很困难。尽管Flutter提供了一些方法来创建状态变量并在更改时刷新UI，但它仍然相当有限。一些挑战仍未解决:
* 异步请求需要在本地缓存，因为每当UI更新时重新执行它们是不合理的。
* 因为我们有一个缓存，如果我们不小心，我们的缓存可能会过期。
* 我们还需要处理错误和加载状态

算了，大家还是自己去看吧。

### 5.3 开始Riverpod

#### 5.3.1 安装
```text
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```
analysis_options.yaml:
```yaml
analyzer:
  plugins:
    - custom_lint
```
再安装个VSCode的扩展，Flutter Riverpod Snippets：
https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets

本人向来不喜欢描述这些按部就班的事情，大家自己去弄吧。

#### 5.3.2 hello world!
下面的代码如果出现红波浪：

```dart
part 'main.g.dart';
```

错误是Target of URI hasn't been generated: 'package:flutter_study/main.g.dart'.用了pub get这些命令试图修复结果失败。
这就没意思了。后来搞定了，原来是安装后要执行下面两行命令，我还以为要未捷身先死了呢。
```terminal
flutter pub get
flutter pub run build_runner watch
```
运行后发现生成和修改了几个文件，其中一个生成的文件就是main.g.dart。


ok继续看代码：
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}

```
注意几点，第一，runApp不提供MyApp为参数了，而是包在了ProviderScope的child命名参数中。其次MyApp现在继承自ConsumerWidget，
它是一个StatefulWidget，但是它应该重写了createState方法，并定义了一个新的build方法，该方法传入了一个WidgetRef位置参数，
我们可以用ref.watch(helloWorldProvider)获得“Hello world”这个字符串。这个helloWorldProvider又是啥呢？
它定义在main.g.dart文件中，目前看不懂。

### 5.4 Riverpod要点

#### 5.4.1 发送网络请求

<b>step1:设置ProviderScope</b>

在我们开始进行网络请求之前，请确保在应用程序的根目录中添加了ProviderScope。
```dart
void main() {
  runApp(
    // To install Riverpod, we need to add this widget above everything else.
    // This should not be inside "MyApp" but as direct parameter to "runApp".
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```
这样做将为整个应用程序启用Riverpod。

<b>step2:在“Provider”中执行网络请求</b>
举个例子，让我们制作一个简单的应用程序，它建议在无聊的时候做一个随机的活动。

为此，我们将使用Bored API。特别是，我们将在/api/activity端点上执行GET请求。这将返回一个JSON对象，我们将把它解析为一个Dart类实例。
下一步就是在UI中显示这个活动。我们还将确保在发出请求时呈现加载状态，并优雅地处理错误。

听起来不错吗?让我们开始吧!

不搞了，名堂太多了。



## 第六章 数据调用和后端


### 6.1 网络 & http

这是跳不过去的，好好学。

<b>跨平台http网络</b>

http package 提供了 http 请求最简单易用的方法。该 package 支持 Android、iOS、macOS、Windows、Linux 以及 Web。

部分平台需要额外的步骤。

android: android/app/src/main/AndroidManifest.xml
```xml
<manifest xmlns:android...>
 ...
 <uses-permission android:name="android.permission.INTERNET" />
 <application ...
</manifest>
```
macOS:
macOS 应用程序必须在相关 *.entitlements 的文件中允许网络访问。
```xml
<key>com.apple.security.network.client</key>
<true/>
```
### 6.2 获取网络数据

原本打算在中文网按照它的示例学习，不过根据该网一贯的恶行，我先运行了它的完整示例代码，确保我不会学个寂寞。
结果你猜怎么着？出现了语法错误！！！！！没错，不是缺失包这种错误，是语法错误。我感谢你whole family eighteen generations。

与http请求相关的包有http和dio两个，看上去http更简单一点，所以选择它。

我现在参考的是pub.dev上的资料：https://pub.dev/packages/http

#### 6.2.1 安装http

安装：
```terminal
> flutter pub add http
```
这个包包含一组高级函数和类，可以很容易地使用HTTP资源。它是多平台的(移动、桌面和浏览器)，支持多种实现。

#### 6.2.2 使用http

最简单的用法：
```dart
import 'package:http/http.dart' as http;

var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('example.com', 'foobar.txt')));
```
android和macOS需要一些配置才能进行网络请求。

如果向同一台服务器发出多个请求，可以使用Client保持打开持久连接，而不是发出一次性请求。如果您这样做，请确保在完成后关闭客户端:
```dart
var client = http.Client();
try {
  var response = await client.post(
      Uri.https('example.com', 'whatsit/create'),
      body: {'name': 'doodle', 'color': 'blue'});
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  var uri = Uri.parse(decodedResponse['uri'] as String);
  print(await client.get(uri));
} finally {
  client.close();
}
```
疑问，http请求不是长连接，如何保持持久连接？

您还可以通过自己创建Request或StreamedRequest对象并将它们传递给Client.send来对请求和响应施加更细粒度的控制。
这个包被设计成可组合的。这使得外部库可以很容易地相互协作，向其中添加行为。希望添加行为的库应该创建一个BaseClient的子类，该子类包装另一个客户端并添加所需的行为:
```dart
class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}
```

#### 6.2.3 重试请求
包http/retry.dart提供了一个类RetryClient来包装底层http。透明地重试失败请求的客户端。
```dart
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

Future<void> main() async {
  final client = RetryClient(http.Client());
  try {
    print(await client.read(Uri.http('example.org', '')));
  } finally {
    client.close();
  }
}
```
默认情况下，这将重试任何响应状态码为503(表示服务器尚未处于可以接受请求的状态)的请求，最多重试三次。
它在第一次重试之前等待500ms，并且每次延迟增加1.5倍。所有这些都可以使用RetryClient()构造函数进行定制。

#### 6.2.4 Choosing an implementation
该包有多种实现:http客户端接口。默认情况下，package:http在web上使用BrowserClient，在所有其他平台上使用iocclient。您可以根据应用程序的需要选择不同的Client实现。
除了几行配置之外，您可以在不更改应用程序代码的情况下更改实现。

一些得到良好支持的实现有:
<table>
<thead>
<tr>
<th>Implementation</th>
<th>Supported Platforms</th>
<th>SDK</th>
<th>Caching</th>
<th>HTTP3/QUIC</th>
<th>Platform Native</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>package:http</code> — <a href="https://pub.dev/documentation/http/latest/io_client/IOClient-class.html"><code>IOClient</code></a></td>
<td>Android, iOS, Linux, macOS, Windows</td>
<td>Dart, Flutter</td>
<td>❌</td>
<td>❌</td>
<td>❌</td>
</tr>
<tr>
<td><code>package:http</code> — <a href="https://pub.dev/documentation/http/latest/browser_client/BrowserClient-class.html"><code>BrowserClient</code></a></td>
<td>Web</td>
<td>Dart, Flutter</td>
<td>―</td>
<td>✅︎</td>
<td>✅︎</td>
</tr>
<tr>
<td><a href="https://pub.dev/packages/cupertino_http"><code>package:cupertino_http</code></a> — <a href="https://pub.dev/documentation/cupertino_http/latest/cupertino_http/CupertinoClient-class.html"><code>CupertinoClient</code></a></td>
<td>iOS, macOS</td>
<td>Flutter</td>
<td>✅︎</td>
<td>✅︎</td>
<td>✅︎</td>
</tr>
<tr>
<td><a href="https://pub.dev/packages/cronet_http"><code>package:cronet_http</code></a> — <a href="https://pub.dev/documentation/cronet_http/latest/cronet_http/CronetClient-class.html"><code>CronetClient</code></a></td>
<td>Android</td>
<td>Flutter</td>
<td>✅︎</td>
<td>✅︎</td>
<td>―</td>
</tr>
<tr>
<td><a href="https://pub.dev/packages/fetch_client"><code>package:fetch_client</code></a> — <a href="https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html"><code>FetchClient</code></a></td>
<td>Web</td>
<td>Dart, Flutter</td>
<td>✅︎</td>
<td>✅︎</td>
<td>✅︎</td>
</tr>
</tbody>
</table>

#### 6.2.4 Configuration 
要使用HTTP client 实现，而不是默认的，你必须:
* 将HTTP client 作为依赖项添加。
* 配置HTTP client 。
* 将HTTP client连接到使用它的代码。

##### 1.将HTTP client 作为依赖项添加

要将与Dart SDK兼容的包添加到项目中，请使用Dart pub add。

例如:
```text
# Replace  "fetch_client" with the package that you want to use.
dart pub add fetch_client
```
要添加需要Flutter SDK的包，请使用Flutter pub add。

例如:
```text
# Replace  "cupertino_http" with the package that you want to use.
flutter pub add cupertino_http
```

##### 2.配置HTTP client
不同的package:http Client实现可能需要不同的配置选项。

添加一个返回正确配置的Client的函数。您可以在不同的平台上返回不同的Client。

例如:
```dart
Client httpClient() {
  if (Platform.isAndroid) {
    final engine = CronetEngine.build(
        cacheMode: CacheMode.memory,
        cacheMaxSize: 1000000);
    return CronetClient.fromCronetEngine(engine);
  }
  if (Platform.isIOS || Platform.isMacOS) {
    final config = URLSessionConfiguration.ephemeralSessionConfiguration()
      ..cache = URLCache.withCapacity(memoryCapacity: 1000000);
    return CupertinoClient.fromSessionConfiguration(config);
  }
  return IOClient();
}
```
配置例子： https://github.com/dart-lang/http/tree/master/pkgs/flutter_http_example

<b>Supporting browser and native</b>

如果您的应用程序可以在浏览器和本机中运行，则必须将浏览器和本机配置放在单独的文件中，并根据平台导入正确的文件。

例如:
```dart
// -- http_client_factory.dart
Client httpClient() {
  if (Platform.isAndroid) {
    return CronetClient.defaultCronetEngine();
  }
  if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoClient.defaultSessionConfiguration();
  }
  return IOClient();
}
// -- http_client_factory_web.dart
Client httpClient() => FetchClient();
// -- main.dart
import 'http_client_factory.dart'
    if (dart.library.js_interop) 'http_client_factory_web.dart'

// The correct `httpClient` will be available.
```

##### 3.将HTTP client连接到使用它的代码

将Client传递到使用它的地方的最好方法是通过参数显式地传递。

例如:
```dart
void main() {
  final client = httpClient();
  fetchAlbum(client, ...);
}```

在Flutter中，您可以使用许多状态管理方法中的一种。

如果你依赖于使用顶级函数(例如http.post)或调用Client()构造函数的代码，那么你可以使用runWithClient来确保使用正确的Client。
当产生一个Isolate时，它不会从调用区域继承任何变量，因此需要在每个使用package:http的隔离中使用runWithClient。

通过在环境中定义no_default_http_client=true，可以确保只使用已显式配置的客户机。这也将允许删除默认的Client实现，从而减小应用程序的大小。
```text
$ flutter build appbundle --dart-define=no_default_http_client=true ...
$ dart compile exe --define=no_default_http_client=true ...
```

到这里pub.dev上的资料就结束了，好像根本没有理解难点，我仅仅纯翻译了一下而已。代码也没有去测试，因为不想去服务端代码。


### 6.3 dio

因为http过于简单，但是功能也似乎简单了点。于是看了看dio，还是不错的，
除了post,get还支持全局配置、Restful API、FormData、拦截器、 请求取消、Cookie 管理、文件上传/下载、超时、自定义适配器、转换器等。

最棒的是它有中文资料：https://github.com/cfug/dio/blob/main/dio/README-ZH.md

虽然很不错，但我浏览了一番文档，也没有理解难度，所以大家可以自己去看文档。

## 进阶篇

以上是我第一遍快速入门的知识点。在实际项目中，以上内容是不够的，所以还需完善自己的技能树。
不过我不想章节弄混乱，所以我将一些进阶内容放在进阶篇。

## 第七章 布局

先说下Flutter下两大风格的组件(集)，一个是Material,它由Google提出，可以理解为Android风格的组件；另一个是Cupertino，它是IOS风格的组件。
根据目前的经验，Flutter程序的入口的runApp函数需要在顶层传入这两个Widget之一。

前面我们常见的Scaffold也是一个常用的Widget，它一般被默认为MaterialApp的顶级容器，会填充整个屏幕大小。Scaffold不要嵌套使用，
在Scaffold中下列Widget会找到自己合适的位置：
* AppBar
* BottomAppBar
* FloatingActionButton
* Drawer
* BottomNavigationBar
* BottomSheet
* SnackBar
* MaterialBanner

在网上到处找各个Widgets之间的继承关系，而且文档和库文件也不提示一个类有什么子类，我只好做一个基础工作，一个个手动列出所有能碰到的Widget的继承关系。
因为名单较长，我将其放在了documents/widget.yaml中。
为什么要这么不嫌麻烦的列出这么多Widget呢，我想大多数Widget可以“望文生义”，看名字基本能猜个八九不离十它们是干什么的，
所以这是一个很好的开发向导,就是名单太长了点。

布局Widgets分为三类：
* Single-child layout widgets:单个子widget
* Multi-child layout widgets：多个子widgets
* Sliver widgets：与滚动条相关

### tip1:垂直居中
```dart
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ...
    ],
  )
```

## 第八章 主题

## 第九章 Flutter命令行

想要查看一个命令的详细用法，示例如下：

```terminal

# 显示 flutter devices命令的详细用法
flutter --help devices  

```
<table class="table table-striped nowrap">
  <thead>
    <tr>
      <th>
<t>命令</t>
</th>
      <th>
<t>示例</t>
</th>
      <th>
<t>描述</t>
</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>analyze</td>
      <td><code class="language-plaintext highlighter-rouge">flutter analyze -d &lt;DEVICE_ID&gt;</code></td>
      <td><nt-wrapper>分析项目的 Dart 源码。<br>该命令用来替代 <a href="https://dart.cn/tools/dart-analyze"><code class="language-plaintext highlighter-rouge">dart analyze</code></a>。</nt-wrapper></td>
    </tr>
    <tr>
      <td>assemble</td>
      <td><code class="language-plaintext highlighter-rouge">flutter assemble -o &lt;DIRECTORY&gt;</code></td>
      <td><nt-wrapper>组建和构建 Flutter 资源。</nt-wrapper></td>
    </tr>
    <tr>
      <td>attach</td>
      <td><code class="language-plaintext highlighter-rouge">flutter attach -d &lt;DEVICE_ID&gt;</code></td>
      <td><nt-wrapper>连接到运行中的应用程序。</nt-wrapper></td>
    </tr>
    <tr>
      <td>bash-completion</td>
      <td><code class="language-plaintext highlighter-rouge">flutter bash-completion</code></td>
      <td><nt-wrapper>输出 Shell 命令行设置的脚本。</nt-wrapper></td>
    </tr>
    <tr>
      <td>build</td>
      <td><code class="language-plaintext highlighter-rouge">flutter build &lt;DIRECTORY&gt;</code></td>
      <td><nt-wrapper>Flutter 构建命令。</nt-wrapper></td>
    </tr>
    <tr>
      <td>channel</td>
      <td><code class="language-plaintext highlighter-rouge">flutter channel &lt;CHANNEL_NAME&gt;</code></td>
      <td><nt-wrapper>列出或切换 Flutter 的渠道分支</nt-wrapper></td>
    </tr>
    <tr>
      <td>clean</td>
      <td><code class="language-plaintext highlighter-rouge">flutter clean</code></td>
      <td><nt-wrapper>删除 <code class="language-plaintext highlighter-rouge">build/</code> 和 <code class="language-plaintext highlighter-rouge">.dart_tool/</code> 目录。</nt-wrapper></td>
    </tr>
    <tr>
      <td>config</td>
      <td><code class="language-plaintext highlighter-rouge">flutter config --build-dir=&lt;DIRECTORY&gt;</code></td>
      <td><nt-wrapper>设置 Flutter 配置项。如果你需要删除一个配置项，请将该配置项的值置空。</nt-wrapper></td>
    </tr>
    <tr>
      <td>create</td>
      <td><code class="language-plaintext highlighter-rouge">flutter create &lt;DIRECTORY&gt;</code></td>
      <td><nt-wrapper>创建一个新项目。</nt-wrapper></td>
    </tr>
    <tr>
      <td>custom-devices</td>
      <td><code class="language-plaintext highlighter-rouge">flutter custom-devices list</code></td>
      <td><nt-wrapper>添加、删除、列出或重置定制的设备。</nt-wrapper></td>
    </tr>
    <tr>
      <td>devices</td>
      <td><code class="language-plaintext highlighter-rouge">flutter devices -d &lt;DEVICE_ID&gt;</code></td>
      <td><nt-wrapper>列出所有连接的设备。</nt-wrapper></td>
    </tr>
    <tr>
      <td>doctor</td>
      <td><code class="language-plaintext highlighter-rouge">flutter doctor</code></td>
      <td><nt-wrapper>显示相关已安装工具的信息。</nt-wrapper></td>
    </tr>
    <tr>
      <td>downgrade</td>
      <td><code class="language-plaintext highlighter-rouge">flutter downgrade</code></td>
      <td><nt-wrapper>将 Flutter 降级到当前渠道分支的上一个有效版本。</nt-wrapper></td>
    </tr>
    <tr>
      <td>drive</td>
      <td><code class="language-plaintext highlighter-rouge">flutter drive</code></td>
      <td><nt-wrapper>运行当前项目的 Flutter 测试。</nt-wrapper></td>
    </tr>
    <tr>
      <td>emulators</td>
      <td><code class="language-plaintext highlighter-rouge">flutter emulators</code></td>
      <td><nt-wrapper>列出、启动或创建模拟器。</nt-wrapper></td>
    </tr>
    <tr>
      <td>gen-l10n</td>
      <td><code class="language-plaintext highlighter-rouge">flutter gen-l10n &lt;DIRECTORY&gt;</code></td>
      <td><nt-wrapper>为 Flutter 项目生成 l10n 本地化。</nt-wrapper></td>
    </tr>
    <tr>
      <td>install</td>
      <td><code class="language-plaintext highlighter-rouge">flutter install -d &lt;DEVICE_ID&gt;</code></td>
      <td><nt-wrapper>在连接的设备上安装 Flutter 应用程序。</nt-wrapper></td>
    </tr>
    <tr>
      <td>logs</td>
      <td><code class="language-plaintext highlighter-rouge">flutter logs</code></td>
      <td><nt-wrapper>显示运行中的 Flutter 应用程序的日志内容。</nt-wrapper></td>
    </tr>
    <tr>
      <td>precache</td>
      <td><code class="language-plaintext highlighter-rouge">flutter precache &lt;ARGUMENTS&gt;</code></td>
      <td><nt-wrapper>下载并预缓存 Flutter 相关平台工具的二进制文件</nt-wrapper></td>
    </tr>
    <tr>
      <td>pub</td>
      <td><code class="language-plaintext highlighter-rouge">flutter pub &lt;PUB_COMMAND&gt;</code></td>
      <td><nt-wrapper>package 的相关操作命令。<br>该命令用来替代 <a href="https://dart.cn/tools/dart-pub"><code class="language-plaintext highlighter-rouge">dart pub</code></a>。</nt-wrapper></td>
    </tr>
    <tr>
      <td>run</td>
      <td><code class="language-plaintext highlighter-rouge">flutter run &lt;DART_FILE&gt;</code></td>
      <td><nt-wrapper>运行 Flutter 应用程序。</nt-wrapper></td>
    </tr>
    <tr>
      <td>screenshot</td>
      <td><code class="language-plaintext highlighter-rouge">flutter screenshot</code></td>
      <td><nt-wrapper>在连接的设备上对 Flutter 应用程序进行截图。</nt-wrapper></td>
    </tr>
    <tr>
      <td>symbolize</td>
      <td><code class="language-plaintext highlighter-rouge">flutter symbolize --input=&lt;STACK_TRACK_FILE&gt;</code></td>
      <td><nt-wrapper>读取并解析 Flutter 应用程序中 AOT 编译的堆栈跟踪信息。</nt-wrapper></td>
    </tr>
    <tr>
      <td>test</td>
      <td><code class="language-plaintext highlighter-rouge">flutter test [&lt;DIRECTORY|DART_FILE&gt;]</code></td>
      <td><nt-wrapper>运行测试<br>该命令用来替代 <a href="https://dart.cn/tools/dart-test"><code class="language-plaintext highlighter-rouge">dart test</code></a>。</nt-wrapper></td>
    </tr>
    <tr>
      <td>upgrade</td>
      <td><code class="language-plaintext highlighter-rouge">flutter upgrade</code></td>
      <td><nt-wrapper>升级你的 Flutter 版本。</nt-wrapper></td>
    </tr>
  </tbody>
</table>

## 第十章 实战一个项目

初步构思一个小区交流app，有底部导航条，首页显示一些小区动态消息。其它还要什么页面边做边想。

### 10.1 拆分一个类

把类拆分的目的首先是简化类，其次是抽取出层级结构。

### 10.2 项目目录结构

习惯了java的包命名规范，到flutter后不习惯了。首先是java一般是一个文件一个类，其次是java中的MVC模型，领域模型，依赖注入、注解与零配置、静态资源等等都有成熟的模式，
使得java程序的层次结构清晰。在flutter学习中，视图、逻辑、模型都没有分开，这给我一个艰巨的任务，就是理清这些类的用途，用好的文件层次结构来管理它们。
另外java可以使用反射、代理等技术来实现一些框架级的编程，而dart中我暂时还未接触过反射，Google了一下，dart还是有类似反射的东西，我看看能不能搞个依赖注入框架，
对一些项目运行期间可以存在单实例的类进行依赖注入。
