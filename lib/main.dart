import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _randomColor;
  Random _random = Random();
  double _sBarH = 55;
  String _sBarTitle = " ";

  void _incrementCounter() {
    getRandomColor();
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<void> getRandomColor() async {
    Color setColor = Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
    setState(() {
      _randomColor = setColor;
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: _randomColor,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: _sBarH,

          backgroundColor: Colors.orangeAccent,
          flexibleSpace: Container(
              child: InkWell(
            onTap: () {
              getRandomColor();
              setState(() {
                if (_sBarH == 55) {
                  _sBarH = 200;
                  _sBarTitle =
                      "Is this what you expect or it must be extended Appbar with own BlackJack and other stuff?:)";
                } else {
                  _sBarH = 55;
                  _sBarTitle = " ";
                }
              });
            },
            child: Center(
              child: Text(
                _sBarTitle,
                style: TextStyle(fontSize: 22.0, color: Colors.white),
              ),
            ),
          )),
        ),
        SliverFillRemaining(
          child: InkWell(
              onTap: () {
                getRandomColor();
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              )),
        ),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
