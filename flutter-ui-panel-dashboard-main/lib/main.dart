import 'package:admin_panel_responsive_flutter/Camera.dart';
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/Home.dart';
import 'package:admin_panel_responsive_flutter/pages/panel_center/panel_center_page.dart';
import 'package:flutter/material.dart';
import 'pages/analytics.dart';
import 'package:admin_panel_responsive_flutter/Stocks.dart';
import 'package:admin_panel_responsive_flutter/Scan.dart';
import 'pages/drawer/drawer_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Img;
import 'globals.dart' as globals;
import 'package:admin_panel_responsive_flutter/pages/charts.dart';

class Person {
  String name;
  Color color;
  Image image;
  Person({required this.name, required this.color, required this.image});
}

// final camera = await availableCameras();
//
// WidgetsFlutterBinding.ensureInitialized();
//
// // Obtain a list of the available cameras on the device.
// final cameras = await availableCameras();
//
// // Get a specific camera from the list of available cameras.
// final firstCamera = cameras.first;
//
// >>>>>>> Stashed changes

// void main() {
//   runApp(MyApp());
// }



Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  globals.cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  globals.firstCamera = globals.cameras.first;

  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stonks',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffffffff),
          primarySwatch: Colors.blue,
          canvasColor: Constants.purpleLight),
          //canvasColor: const Color(0xff303f9f)),
      home: Home(),
      routes: {
        '/Stocks': (context) => const Stocks(),
        '/Analytics': (context) => const Analytics(),
        '/Scan': (context) => TakePictureScreen(camera: globals.firstCamera),
      },
    );
  }
}


// TODO

class Stocks extends StatelessWidget {
  const Stocks({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Inventory'), backgroundColor: Constants.purpleLight,),
  //     drawer: DrawerPage(),
  //     body: Text(
  //         'first',
  //         style: TextStyle(fontSize: 24.0),
  //     ),
  //   );
  // }
  //
  //
  @override
  Widget build(BuildContext context) {
    List<Person> _persons = [
      Person(name: "Chocolate Cupcake", color: Color(0xfff8b250), image: Image.asset('assets/chocolate.png', height: 30),),
      Person(name: "Vanilla Cupcake", color: Color(0xffff5182), image: Image.asset('assets/vanilla.png', height: 30),),
      Person(name: "Coffee Cupcake", color: Color(0xff0293ee), image: Image.asset('assets/coffee.png', height: 30),),
      Person(name: "Water", color: Color(0xff0293ee), image: Image.asset('assets/water.png', height: 30),),

    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Inventory"),
          backgroundColor: const Color(0XFF1e224c),
        ),
        drawer: DrawerPage(),
        body:
      SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                left: Constants.kPadding / 2),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              // child: Container(
              //   width: double.infinity,
              //   child: ListTile(
              //     //leading: Icon(Icons.sell),
              //     title: Text(
              //       "Products Available",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     subtitle: Text(
              //       "82% of Products Avail.",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     trailing: Chip(
              //       label: Text(
              //         "20,500",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ),
          BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: List.generate(
                  _persons.length,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      child: Text(
                        _persons[index].name.substring(0, 1),
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: _persons[index].color,
                    ),
                    title: Text(
                      _persons[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: _persons[index].image,
                    // Image.asset('assets/chocolate.png', height: 30),

                        // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.message,
                    //       color: Colors.white,
                    //     )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first')),
      body: Center(
        child: Text(
          'first',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}



