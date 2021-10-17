import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_center/panel_center_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_left/panel_left_page.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_right/panel_right_page.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/app_bar_widget.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Header.dart';
import 'package:admin_panel_responsive_flutter/InputWrapper.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0XFF1e224c)),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xffffecb3),
            Color(0xffffecb3),
            //const Color(0xFF5C6BC0),
             //Colors.white
            //const Color(0xFF212121)
            //const Color(0xFF303F9f)
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff26a69a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
