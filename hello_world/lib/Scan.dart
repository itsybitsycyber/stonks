import 'package:flutter/material.dart';
import 'Checkout.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';
import 'Checkout.dart';
import 'main.dart';
import 'Camera.dart';
import 'globals.dart' as globals;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Img;

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
                color: globals.matrix[index] == 1 ? Colors.black : Colors.white,
                child: Text(""),
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
                child: globals.matrix[0] == globals.chocolate[0] && globals.matrix[1] == globals.chocolate[1] && globals.matrix[2] == globals.chocolate[2] && globals.matrix[3] == globals.chocolate[3] &&
                    globals.matrix[4] == globals.chocolate[4] && globals.matrix[5] == globals.chocolate[5] && globals.matrix[6] == globals.chocolate[6] && globals.matrix[7] == globals.chocolate[7] &&
                    globals.matrix[8] == globals.chocolate[8] ? Text("Chocolate Cupcake \t\t R30", style: TextStyle(color: Colors.black, fontSize: 15,),) :
                (globals.matrix[0] == globals.vanilla[0] && globals.matrix[1] == globals.vanilla[1] && globals.matrix[2] == globals.vanilla[2] && globals.matrix[3] == globals.vanilla[3] &&
                    globals.matrix[4] == globals.vanilla[4] && globals.matrix[5] == globals.vanilla[5] && globals.matrix[6] == globals.vanilla[6] && globals.matrix[7] == globals.vanilla[7] &&
                    globals.matrix[8] == globals.vanilla[8] ? Text("Vanilla Cupcake \t\t R30", style: TextStyle(color: Colors.black, fontSize: 15,),) : Text("Coffee Cupcake \t\t R30", style: TextStyle(color: Colors.black, fontSize: 15,),))
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
                        if (globals.matrix == globals.chocolate) {
                          globals.cart.add("Chocolate Cupcake");
                          globals.total += 30;
                        } else if (globals.matrix == globals.vanilla) {
                          globals.cart.add("Vanilla Cupcake");
                          globals.total += 20;
                        } else if (globals.matrix == globals.coffee) {
                          globals.cart.add("Coffee Cupcake");
                          globals.total += 10;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  TakePictureScreen(
                            // Pass the appropriate camera to the TakePictureScreen widget.
                            camera: globals.firstCamera,
                          ),),
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

                          if (globals.matrix == globals.chocolate) {
                            globals.cart.add("Chocolate Cupcake");
                            globals.total += 30;
                          } else if (globals.matrix == globals.vanilla) {
                            globals.cart.add("Vanilla Cupcake");
                            globals.total += 20;
                          } else if (globals.matrix == globals.coffee) {
                            globals.cart.add("Coffee Cupcake");
                            globals.total += 10;
                          }
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
      drawer: DrawerPage(),
    );
  }
}

