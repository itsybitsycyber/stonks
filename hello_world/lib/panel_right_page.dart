import 'constants.dart';
import 'charts.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                  left: Constants.kPadding / 2),
            ),
            LineChartSample1(),
            SizedBox(height: 20),
            PieChartSample2(),
            BarChartSample2(),
          ],
        ),
      ),
    );
  }
}
