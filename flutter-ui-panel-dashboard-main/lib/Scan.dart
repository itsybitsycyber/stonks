import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Checkout.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';


class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan a code"),
        backgroundColor: const Color(0XFF1e224c),
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
          SizedBox(height: 50,),
          Column(
            children: [ Center(
                child:Text("Item Detected as: ", style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)
            ), SizedBox(height: 12,),
              Center(
                child:Text("Chocolate Cupcake        R20", style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                ),)
            ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 60),
                  Container(
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
                        primary: const  Color(0xff9dd9c6),
                        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                      ),
                    ),
                  ),
                ),
                  SizedBox(width: 30),
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
                          primary: const  Color(0xff9dd9c6),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
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
      drawer: DrawerPage(),
    );
  }
}