import 'package:flutter/material.dart';
import '../../constants.dart';
import 'charts.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';

class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analytics'), backgroundColor: const Color(0XFF1e224c)),
      body:
      Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.orange,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      right: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        //leading: Icon(Icons.shopping_basket),
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18% of Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
    Text(
    'Income/Expense Overview',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 2),
    textAlign: TextAlign.left,
    ),
                PieChartSample2(),
                Text(
                  'Monthly Sales',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  textAlign: TextAlign.left,
                ),
                LineChartSample2(),
                BarChartSample2(),
                LineChartSample1(),
                Padding(
                  padding: const EdgeInsets.only(
                      right: Constants.kPadding / 2,
                      bottom: Constants.kPadding,
                      top: Constants.kPadding,
                      left: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerPage(),
    );
  }

}
