import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Home.dart';

import 'Home.dart';
import 'globals.dart' as globals;
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';


class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: const Color(0XFF1e224c),
      ),
      drawer: DrawerPage(),
      body: Center(
        child: Column (
          children: [
            SizedBox(height: 20,),
            Text("Cart:", style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Text("Vanilla Cupcake \t\t R20", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Text("Panda Coffee Mug \t\t R30", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Text("Total Payment Due: \t\t\t R50", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Image.asset('assets/file.png', height: 300, width: 300),
            Container(
              child: Center(
                child: ElevatedButton(
                  child: const Text("COMPLETE ORDER",style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff9dd9c6),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}