import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';


class Stocks extends StatelessWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock"),
        backgroundColor: const Color(0XFF1e224c),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}