import 'package:flutter/material.dart';
import 'Checkout.dart';


class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan a code"),
        backgroundColor: Color(0xff00bcd4),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
        left: 50,
        bottom: 10,
        right: 50),
      child:
      ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(
            child:Text("Detected Pattern", style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),)
          ),
          SizedBox(height: 20,),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black,
                child: Text("index: $index"),
              );
            },
          ),
          SizedBox(height: 30,),
          Column(
            children: [ Center(
                child:Text("Item Detected as: ", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)
            ), SizedBox(height: 12,),
              Center(
                child:Text("Chocolate Cupcake \t\t R20", style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                ),)
            ),
              SizedBox(height: 15,),
              Row(
                children: [              Container(
                  child: Center(
                    child: ElevatedButton(
                      child: const Text("SCAN AGAIN",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 10),
                      ),
                    ),
                  ),
                ),
                  SizedBox(width: 15,),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: const Text("CHECKOUT",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Checkout()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff00bcd4),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        ),
                      ),
                    ),
                  )],
              )
            ]
          )
        ],
      ),
      ),
    );
  }
}