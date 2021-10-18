import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Img;
import 'globals.dart' as globals;
import 'Scan.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';



// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan a code"),
        backgroundColor: const Color(0XFF1e224c),
      ),
      drawer: DrawerPage(),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        backgroundColor:  const Color(0XFF1e224c),
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();
            var path = image.path;
            final bytes = await File(path).readAsBytes();
            final Img.Image bro = Img.decodeImage(bytes)!;

            var data = bro.getBytes();

            // Initialise Image Processing
            // ENHANCE
            var width = bro.width;
            var height = bro.height;
            var size = width * height;

            // Create a normalised array of luminance values for each pixel
            var norm = List.filled(size, 0.0, growable: false);
            for (var p = 0; p < norm.length; p += 1) {
              int r = data[p * 4];
              int g = data[(p * 4) + 1];
              int b = data[(p * 4) + 2];
              var lum = (0.2 * r + 0.7 * g + 0.1 * b);
              if (p > 9600 && p < 28800) {
                //print(p.toString() + " >>> " + lum.toString());
              }
              norm[p] = lum.toDouble();
            }

            print("Length - : " + norm.length.toString());

            double sum0 = 0;
            double sum1 = 0;
            double sum2 = 0;
            double sum3 = 0;
            double sum4 = 0;
            double sum5 = 0;
            double sum6 = 0;
            double sum7 = 0;
            double sum8 = 0;

            int box_top_start = (height-width)~/2;
            int blok = width~/3;
            int k = width*box_top_start;

            for (int y = box_top_start; y < width + box_top_start; y++) {
              for (int x = 0; x < width; x++) {
                //TOP
                if (y < box_top_start + blok) {
                  if (x < blok) {
                    sum0 += norm[k+x+y*width];
                  }
                  if (x < blok*2 && x >= blok) {
                    sum1 += norm[k+x+y*width];
                  }
                  if (x < blok*3 && x >= blok*2) {
                    sum2 += norm[k+x+y*width];
                  }
                }
                //MID
                if (y < box_top_start + blok*2 && y >= box_top_start + blok) {
                  if (x < blok) {
                    sum3 += norm[k+x+y*width];
                  }
                  if (x < blok*2 && x >= blok) {
                    sum4 += norm[k+x+y*width];
                  }
                  if (x < blok*3 && x >= blok*2) {
                    sum5 += norm[k+x+y*width];
                  }
                }
                //BOT
                if (y < box_top_start + blok*3 && y >= box_top_start + blok*2) {
                  if (x < blok) {
                    sum6 += norm[k+x+y*width];
                  }
                  if (x < blok*2 && x >= blok) {
                    sum7 += norm[k+x+y*width];
                  }
                  if (x < blok*3 && x >= blok*2) {
                    sum8 += norm[k+x+y*width];
                  }
                }
              }
            }


            var arr = List.filled(9, 0.0, growable: false);
            arr[0] = sum0/6400;
            arr[1] = sum1/6400;
            arr[2] = sum2/6400;
            arr[3] = sum3/6400;
            arr[4] = sum4/6400;
            arr[5] = sum5/6400;
            arr[6] = sum6/6400;
            arr[7] = sum7/6400;
            arr[8] = sum8/6400;

            var max = arr[0];
            var min = arr[0];

            for (k = 0; k < 9; k++) {
              if (arr[k] < min) {
                min = arr[k];
              }
              if (arr[k] > max) {
                max = arr[k];
              }
            }

            print("Min : " + min.toString());
            print("Max : " + max.toString());

            var med = (max - min)/2 + min;
            var line = "";
            int z = 0;
            //var matrix = List.filled(9, 0, growable: false);

            for (int a = 0; a < 9; a++) {
              if (arr[z]<med) {
                globals.matrix[z] = 1;
              } else {
                globals.matrix[z] = 0;
              }
              z++;
            }

            print(globals.matrix);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scan()),
            );

            /*
            for (int a = 0; a < 3; a++) {
              for (int b = 0; b < 3; b++) {
                if (arr[z] < med) {
                  line += "X|";
                } else {
                  line += " |";
                }
                z++;
              }
              print(line);
              line = "";
            }

             */




            /*
            print(sum0~/6400);
            print(sum1~/6400);
            print(sum2~/6400);
            print(sum3~/6400);
            print(sum4~/6400);
            print(sum5~/6400);
            print(sum6~/6400);
            print(sum7~/6400);
            print(sum8~/6400);
             */




            /*
            // Square
            var mid = height / 2;
            var oX = mid - (width / 2);

            // Sizes
            var sy = (width / 3).floor();
            print(width.toString() + "x" + height.toString());
            print("block side: " + sy.toString());
            print(oX.toString() + " origin Y");

            // Loop blocks
            // Fokken magic bra
            var blocks = List.filled(9, 0.0, growable: false);
            var blockTotal = 0.0;
            for (var b = 0; b < 9; b += 1) {
              var total = 0.0;
              var blokx = sy * (b % 3);
              var bloky = oX.floor() + sy * (b /3).floor();
              var klobx = (sy - 1) + sy * (b % 3);
              var kloby = oX.floor() + (sy - 1) + sy * (b /3).floor();

              print("blok " + b.toString() + " [" + blokx.toString() + ", " + bloky.toString() + "] -> [" + klobx.toString() + ", " + kloby.toString() + "]");

              for (var i = 0; i < sy; i += sy) {
                for (var j = 0; j < sy; j += sy) {
                  int rX = i + sy * (b % 3);
                  int rY = oX.floor() + j + sy * (b /3).floor();
                  int pos = rX + width * rY;
                  print("[" + rX.toString() + ", " + rY.toString() + "] -> " + pos.toString());
                  total += norm[pos];
                }
              }
              var avg =  total / (width * width) * 1000;
              print(b.toString() + " " + avg.toString());
              blocks[b] = avg;
              blockTotal += avg;
            }

            print(blocks.toString());
            var blockAvg = blockTotal / 9;
            print("avg " + blockAvg.toString());

            for (var b = 0; b < 9; b++) {
              if (blocks[b] >= 0.6) { // TODO: Put avg here dommie
                blocks[b] = 0;
              } else {
                blocks[b] = 1;
              }
            }

            var out = "";
            for (var j = 0; j < 3; j ++) {
              for (var i = 0; i < 3; i ++) {
                if (blocks[i + j * 3] == 1) {
                  out += "|X";
                } else {
                  out += "| ";
                }
              }
              out += "\n";
            }
            print(out);


            print(blocks.toString());
            print(image.path);
            //print(pic.image);

            /*
            var data = pic.getBytes();
            var colorSum = 0;
            for(var x = 0; x < data.length; x += 4) {
              int r = data[x];
              int g = data[x + 1];
              int b = data[x + 2];
              int avg = ((r + g + b) / 3).floor();
              colorSum += avg;
            }
            var brightness = (colorSum / (bro.width * bro.height)).floor();

            print('brightness : ' + brightness.toString());
            */

            // If the picture was taken, display it on a new screen.
            /*
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
            */
          */

          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}