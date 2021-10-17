import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/Home.dart';
import 'package:flutter/material.dart';
import 'pages/analytics.dart';
import 'package:admin_panel_responsive_flutter/Stocks.dart';
import 'package:admin_panel_responsive_flutter/Scan.dart';

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
          scaffoldBackgroundColor: const Color(0xffffffff),
          primarySwatch: Colors.blue,
          canvasColor: Constants.purpleLight),
          //canvasColor: const Color(0xff303f9f)),
      home: Home(),
      routes: {
        '/Stocks': (context) => const Stocks(),
        '/Analytics': (context) => const Analytics(),
        '/Scan': (context) => const Scan(),
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



