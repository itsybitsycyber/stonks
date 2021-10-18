import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Img;
import 'globals.dart' as globals;

//void main() => runApp(MyApp());

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


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}