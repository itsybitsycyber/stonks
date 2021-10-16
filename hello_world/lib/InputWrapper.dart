import 'package:flutter/material.dart';
import 'Analytics.dart';
import 'Scan.dart';
import 'Stocks.dart';


class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Income',
                      ),
                    ),
                  ), FloatingActionButton(
                    backgroundColor: const Color(0xff00bcd4),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Expenses',
                      ),
                    ),
                  ), FloatingActionButton(
                    backgroundColor: const Color(0xff00bcd4),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40,),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text("SCAN",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Scan()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff00bcd4),
                    padding: const EdgeInsets.symmetric(horizontal: 69, vertical: 12),
              ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text("INVENTORY",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Stocks()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff00bcd4),
                  padding: const EdgeInsets.symmetric(horizontal: 49, vertical: 12),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text("ANALYTICS",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Analytics()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff00bcd4),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}