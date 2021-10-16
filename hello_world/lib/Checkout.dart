import 'package:flutter/material.dart';
import 'Home.dart';


class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock"),
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
            Text("Chocolate Cupcake \t\t R20", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 10,),
            Text("Strawberry Cupcake \t\t R20", style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Text("Total Payment Due: \t\t\t R40", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            SizedBox(height: 20,),
            Image.asset('assets/images/file.png', height: 350, width: 300),
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