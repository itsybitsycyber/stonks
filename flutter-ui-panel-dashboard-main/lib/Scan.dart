import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/Checkout.dart';
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
// <<<<<<< Updated upstream
//                 child:Text("Chocolate Cupcake        R20", style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 17,
//                 ),)
//             ),
// =======
                child: (globals.matrix[0] == globals.vanilla[0] && globals.matrix[1] == globals.vanilla[1] && globals.matrix[2] == globals.vanilla[2] && globals.matrix[3] == globals.vanilla[3] &&
                    globals.matrix[4] == globals.vanilla[4] && globals.matrix[5] == globals.vanilla[5] && globals.matrix[6] == globals.vanilla[6] && globals.matrix[7] == globals.vanilla[7] &&
                    globals.matrix[8] == globals.vanilla[8])
                    ? Text("Vanilla Cupcake \t\t R20", style: TextStyle(color: Colors.black, fontSize: 15,),)
                    : (globals.matrix[0] == globals.water[0] && globals.matrix[1] == globals.water[1] && globals.matrix[2] == globals.water[2] && globals.matrix[3] == globals.water[3] &&
                    globals.matrix[4] == globals.water[4] && globals.matrix[5] == globals.water[5] && globals.matrix[6] == globals.water[6] && globals.matrix[7] == globals.water[7] &&
                    globals.matrix[8] == globals.water[8] ? Text("Coffee Mug \t\t R30", style: TextStyle(color: Colors.black, fontSize: 15,),) :
                Text("Unknown Product Detected.", style: TextStyle(color: Colors.black, fontSize: 15,),))
              ),
              SizedBox(height: 15, width: 10,),
              Row(
                children: [
                  SizedBox(width: 10),
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
                        primary: const  Color(0xff9dd9c6),
                        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 10, width: 10,),
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

