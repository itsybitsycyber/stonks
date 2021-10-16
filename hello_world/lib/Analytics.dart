import 'package:flutter/material.dart';


class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
        backgroundColor: Color(0xff00bcd4),
      ),
      body: ListView(
        children: [
          Text("business is doing well.")
        ],
      )
    );
  }
}