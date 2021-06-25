
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:random_color/random_color.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'random bg_color',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'random bg_color'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _bg_color = RandomColor().randomColor();

  void _generate_bg_color() {
    setState(() {
      _bg_color = RandomColor().randomColor();
      print(_bg_color);
    });
  }
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'random bg_color',
      home: Scaffold(
        backgroundColor: _bg_color,
        body: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _generate_bg_color(),
            //FullScreenMode.EMERSIVE_STICKY swipe up or down to bring back bar
          onLongPress: () => enterFullScreen(FullScreenMode.EMERSIVE_STICKY),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'tap to change bg color'
                ),
                Text(
                  _bg_color.toString().substring(10,16),
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'swipe from top or bottom to show system bar'
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
