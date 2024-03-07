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
