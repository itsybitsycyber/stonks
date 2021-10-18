import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Home.dart';

import 'Home.dart';
import 'globals.dart' as globals;

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Color(0xff00bcd4),
      ),
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
            Text("Chocolate Cupcake \t R30", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 10,),
            Text("Vanilla Cupcake \t\t R30", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 10,),
            Text("Coffee Cupcake \t\t R10", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Text("Total Payment Due: \t\t\t R60", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Image.asset('assets/images/file.png', height: 300, width: 300),
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
                    primary: const Color(0xff00bcd4),
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