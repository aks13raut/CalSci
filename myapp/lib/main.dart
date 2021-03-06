import 'package:flutter/material.dart';
import './Widgets/buttons.dart';
import './Widgets/Screen.dart';
import './Methods/ScreenData.dart';
import './Methods/Node.dart';

part './Widgets/MyColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalSci',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CalSci'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScreenData data1 = ScreenData();
  ScreenData data1b = ScreenData();
  ScreenData data2 = ScreenData();
  ScreenData data2b = ScreenData();

  void refreshScreen() {
    setState(() {
      data1 = buffer;
      data1b = ScreenData(buffer: exprTree.toString());
      data2 = results;
      data2b = ScreenData(buffer: exprTree.evaluate().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // appbar widget
    final appBar = AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );

    // mediaquery widget
    final mediaQuery = MediaQuery.of(context);

    // appheight
    final appHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);

    final double mainPadding = 10;

    return Scaffold(
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.all(mainPadding),
          height: appHeight,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20),
                height: appHeight * 0.40,
                child: Screen(
                  data1: data1,
                  data1b: data1b,
                  data2: data2,
                  data2b: data2b,
                ),
              ),
              Divider(color: Colors.white),
              Container(
                height: appHeight * 0.55 - mainPadding,
                child: Buttons(bufferUpdated: refreshScreen),
              ),
            ],
          ),
        ));
  }
}
