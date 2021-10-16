import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/widget_tree.dart';
import 'package:flutter/material.dart';
import 'pages/analytics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stonks',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.purpleDark,
          primarySwatch: Colors.blue,
          canvasColor: Constants.purpleLight),
      home: WidgetTree(),
      routes: {
        '/Stocks': (context) => const FirstScreen(),
        '/Analytics': (context) => const Analytics(),
        '/Scan': (context) => const SecondScreen(),
      },
    );
  }
}


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first')),
      body: Center(
        child: Text(
          'first',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first')),
      body: Center(
        child: Text(
          'first',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}



