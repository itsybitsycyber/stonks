import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Scan.dart';
import 'package:admin_panel_responsive_flutter/Stocks.dart';

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
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),

                      ),
                    ),
                  ), FloatingActionButton(
                    backgroundColor:  const Color(0xff9dd9c6),
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
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),

                      ),
                    ),
                  ), FloatingActionButton(
                    backgroundColor:  const Color(0xff9dd9c6),
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
                    fontSize: 16,
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
                    primary:  const  Color(0xff9dd9c6),
                    padding: const EdgeInsets.symmetric(horizontal: 69, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text("INVENTORY",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
                  primary: const  Color(0xff9dd9c6),
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),

                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text("ANALYTICS",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
                ),
                onPressed: () {
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Analytics()),
                  );*/
                },
                style: ElevatedButton.styleFrom(
                  primary:   const  Color(0xff9dd9c6),
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}