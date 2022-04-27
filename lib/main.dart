// import 'dart:io';
// import 'dart:math';
//
// void main() {
//   print('enter radius:');
//   // Use int.parse(String) to convert input to a number
//   var radius = int.parse(stdin.readLineSync() ?? '10');
//   print(pi);
//   print(pi*radius*radius);
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



void main() => runApp(MyApps());
class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
             // padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              height: 100,
              width: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:  DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                     "http://tineye.com/images/widgets/mona.jpg",
                    ),
                  ),
                 // color: Colors.blue,
                ),
                child: Text('Divya Pathak'),
              ),
            ),
            ListTile(
              title: const Text('My Garage'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),

            ListTile(
              title: const Text('Payments'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('DriveU Back'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('DriveU Coins'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Refer & Earn'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Saved Addresses'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Support'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('DriveU for Business'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}





// List<CameraDescription> cameras = <CameraDescription>[];
//
// Future<void> main() async {
//   // Fetch the available cameras before initializing the app.
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print("${e.code} ${e.description}");
//   }
//   runApp(CameraApp());
// }
//
// class CameraApp extends StatefulWidget {
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }
//
// class _CameraAppState extends State<CameraApp> {
//   CameraController? controller;
//   Timer? countdownTimer;
//   Duration myDuration = const Duration(seconds: 10);
//   File? imageFile;
//   late int selectedCameraIdx;
//   @override
//   void initState() {
//     super.initState();
//     // 1
//     availableCameras().then((availableCameras) {
//
//       cameras = availableCameras;
//       if (cameras.length > 0) {
//         setState(() {
//           // 2
//           selectedCameraIdx = 0;
//         });
//
//         _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
//       }else{
//         print("No camera available");
//       }
//     }).catchError((err) {
//       // 3
//       print('Error: $err.code\nError Message: $err.message');
//     });
//   }
//
//
//
//
//
//   Future _initCameraController(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller!.dispose();
//     }
//
//     // 3
//     controller = CameraController(cameraDescription, ResolutionPreset.high);
//
//     // If the controller is updated then update the UI.
//     // 4
//     controller!.addListener(() {
//       // 5
//       if (mounted) {
//         setState(() {});
//       }
//
//       if (controller!.value.hasError) {
//         print('Camera error ${controller!.value.errorDescription}');
//       }
//     });
//
//     // 6
//     try {
//       await controller!.initialize();
//     } on CameraException catch (e) {
//       //_showCameraException(e);
//     }
//
//     if (mounted) {
//       setState(() {});
//     }
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   //initializedCamera();
//   //   controller = CameraController(cameras[0], ResolutionPreset.max);
//   //   controller?.initialize().then((_) {
//   //     if (!mounted) {
//   //       return;
//   //     }
//   //     setState(() {});
//   //   });
//   // }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//
//
//
//
//
//
//   void _openGallery(BuildContext context) async {
//     // ignore: deprecated_member_use
//     final pickedFile = await ImagePicker.pickImage(
//       source: ImageSource.camera,
//     );
//     setState(() {
//       //imageFile = File(pickedFile!.path);
//     });
//
//    // Navigator.pop(context);
//     //File imagefile = File(imageFile);
//   }
//
//   void startTimer() async {
//     //_openGallery(context);
//     //cameras = await availableCameras();
//
//     countdownTimer =
//         Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
//   }
//
//   Future<XFile?> takePictures() async {
//     final CameraController? cameraController = controller;
//     if (cameraController!.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }
//     try {
//       XFile file = await cameraController.takePicture();
//       return file;
//     } on CameraException catch (e) {
//       print('Error occured while taking picture: $e');
//       return null;
//     }
//   }
//
//
//  clickImage() async {
//   // Take the Picture in a try / catch block. If anything goes wrong,
//   // catch the error.
//   try {
//   // Ensure that the camera is initialized.
//  // await _initializeControllerFuture;
//
//   // Attempt to take a picture and then get the location
//   // where the image file is saved.
//   final image = await controller!.takePicture();
//   } catch (e) {
//   // If an error occurs, log the error to the console.
//   print(e);
//   }
// }
//
//   void setCountDown() {
//     const reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//         clickImage();
//         //takePicture();
//         //_openGallery(context);
//        // _initCameraController(cameras[selectedCameraIdx])
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!controller!.value.isInitialized) {
//       return Container();
//     }
//     String strDigits(int n) => n.toString().padLeft(2, '0');
//     final days = strDigits(myDuration.inDays);
//     // Step 7
//     final hours = strDigits(myDuration.inHours.remainder(24));
//     final minutes = strDigits(myDuration.inMinutes.remainder(60));
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               CameraPreview(controller!),
//               Text(
//                 '$minutes:$seconds',
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 100),
//                 child: ElevatedButton (
//                     onPressed: startTimer, child: const Text("Start"),
//                     //initializedCamera();
//                 ),
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:camera/camera.dart';
// // // import 'dart:io';
// // // import 'package:image_picker/image_picker.dart';
// // //
// // // List<CameraDescription> cameras = <CameraDescription>[];
// // //
// // // Future<void> main() async {
// // //     WidgetsFlutterBinding.ensureInitialized();
// // //     cameras = await availableCameras();
// // //     runApp(CameraApp());
// // //   }
// // //
// // //   initializeCamera() async{
// // //   cameras = await availableCameras();
// // //   }
// // //
// // //   // Fetch the available cameras before initializing the app.
// // // //   try {
// // // //     WidgetsFlutterBinding.ensureInitialized();
// // // //     cameras = await availableCameras();
// // // //   } on CameraException catch (e) {
// // // //     print("${e.code} ${e.description}");
// // // //   }
// // // //   runApp(CameraApp());
// // // // }
// // //
// // // class CameraApp extends StatefulWidget {
// // //   @override
// // //   _CameraAppState createState() => _CameraAppState();
// // // }
// // //
// // // class _CameraAppState extends State<CameraApp> {
// // //   CameraController? controller;
// // //   Timer? countdownTimer;
// // //   Duration myDuration = const Duration(seconds: 10);
// // //   late XFile capturedFile;
// // //   //final CameraLensDirection lensDirection;
// // //   //File? file = File(XFile.path);
// // //
// // //   bool isPreView = false;
// // //   bool isPrecessing = false;
// // //   late List cameras;
// // //   late int selectedCameraIdx;
// // //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     //initializeCamera();
// // //     //cameras = ava;
// // //     controller = CameraController(cameras[0], ResolutionPreset.max);
// // //     controller?.initialize().then((_) {
// // //       if (!mounted) {
// // //         return;
// // //       }
// // //       setState(() {});
// // //     });
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     controller?.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   void startTimer() {
// // //     countdownTimer =
// // //         Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
// // //   }
// // //
// // //   void setCountDown() {
// // //     const reduceSecondsBy = 1;
// // //     setState(() {
// // //       final seconds = myDuration.inSeconds - reduceSecondsBy;
// // //       if (seconds < 0) {
// // //         countdownTimer!.cancel();
// // //       } else {
// // //         myDuration = Duration(seconds: seconds);
// // //       }
// // //     });
// // //   }
// // //
// // //
// // //
// // // Future _initCameraController(CameraDescription cameraDescription) async {
// // //   setState(() {
// // //     isPrecessing = true;
// // //   });
// // //   if (controller != null) {
// // //     await controller?.dispose();
// // //   }
// // // }
// // //
// // //
// // //    _onCapturePressed() async {
// // //     setState(() {
// // //       isPrecessing = true;
// // //     });
// // //     try {
// // //       capturedFile = await controller!.takePicture();
// // //
// // //       setState(() {
// // //         isPrecessing = false;
// // //         isPreView = true;
// // //       });
// // //     } catch (e) {
// // //       print(e);
// // //     }
// // //   }
// // //
// // //   void _onSwitchCamera() async {
// // //     selectedCameraIdx =
// // //     selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
// // //     CameraDescription selectedCamera = cameras[selectedCameraIdx];
// // //
// // //     await _initCameraController(selectedCamera);
// // //     setState(() {
// // //       isPreView = false;
// // //     });
// // //   }
// // //
// // //   void onSetFlashModeButtonPressed(FlashMode mode) {
// // //     setFlashMode(mode).then((_) {
// // //       if (mounted) setState(() {});
// // //      // showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
// // //     });
// // //   }
// // //
// // //   Future<void> setFlashMode(FlashMode mode) async {
// // //     try {
// // //       await controller?.setFlashMode(mode);
// // //     } on CameraException catch (e) {
// // //       _showCameraException(e);
// // //       rethrow;
// // //     }
// // //   }
// // //
// // //   // void showInSnackBar(String message) {
// // //   //   // ignore: deprecated_member_use
// // //   //   _scaffoldKey.currentState.hideCurrentSnackBar();
// // //   //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
// // //   // }
// // //
// // //   void _showCameraException(CameraException e) {
// // //     //showInSnackBar('Error: ${e.code}\n${e.description}');
// // //   }
// // //
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (!controller!.value.isInitialized) {
// // //       return Container();
// // //     }
// // //     String strDigits(int n) => n.toString().padLeft(2, '0');
// // //     final days = strDigits(myDuration.inDays);
// // //     // Step 7
// // //     final hours = strDigits(myDuration.inHours.remainder(24));
// // //     final minutes = strDigits(myDuration.inMinutes.remainder(60));
// // //     final seconds = strDigits(myDuration.inSeconds.remainder(60));
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         body: Center(
// // //           child: Stack(
// // //             alignment: Alignment.center,
// // //             children: [
// // //              // _openCamera(),
// // //               CameraPreview(controller!),
// // //               Text(
// // //                 '$minutes:$seconds',
// // //                 style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 30),
// // //               ),
// // //
// // //
// // //               Padding(
// // //                 padding: const EdgeInsets.only(top: 100),
// // //                 child: ElevatedButton(
// // //                     onPressed: startTimer, child: const Text("Start")),
// // //               ),
// // //               Padding(
// // //                 padding: const EdgeInsets.only(top: 200),
// // //                 child: TextButton.icon(
// // //                   onPressed: isPrecessing
// // //                       ? null
// // //                       : () {
// // //                     if (isPreView) {
// // //                       setState(() {
// // //                         isPreView = false;
// // //                       });
// // //                     } else {
// // //                       setState(() {
// // //                        // _initCameraController(CameraDescription);
// // //                        // _onCapturePressed();
// // //                         //onSetFlashModeButtonPressed(FlashMode mode);
// // //                        // _initCameraController(selectedCameraIdx);
// // //                        // _onSwitchCamera();
// // //                       });
// // //                     }
// // //                   },
// // //                   icon: Icon(
// // //                     Icons.save,
// // //                     size: 35,
// // //                   ),
// // //                   label: isPreView ? Text('Retake') : Text('Capture'),
// // //                 ),
// // //                 // FloatingActionButton(onPressed: (){
// // //                 //   _onCapturePressed();
// // //                 // },
// // //                 //   backgroundColor: Colors.green,
// // //                 //   child: const Icon(Icons.camera_alt_outlined),
// // //                 // ),
// // //               ),
// // //
// // //               IconButton(
// // //                 iconSize: 30,
// // //                 icon: Icon(
// // //                   Icons.flash_off,
// // //                 ),
// // //                 color: controller?.value?.flashMode == FlashMode.off
// // //                     ? Colors.orange
// // //                     : Colors.blue,
// // //                 onPressed: controller != null
// // //                     ? () => onSetFlashModeButtonPressed(FlashMode.off)
// // //                     : null,
// // //               ),
// // //               IconButton(
// // //                 iconSize: 30,
// // //                 icon: Icon(Icons.flash_auto),
// // //                 color: controller?.value?.flashMode == FlashMode.auto
// // //                     ? Colors.orange
// // //                     : Colors.blue,
// // //                 onPressed: controller != null
// // //                     ? () => onSetFlashModeButtonPressed(FlashMode.auto)
// // //                     : null,
// // //               ),
// // //               IconButton(
// // //                 iconSize: 30,
// // //                 icon: Icon(Icons.flash_on),
// // //                 color: controller?.value?.flashMode == FlashMode.always
// // //                     ? Colors.orange
// // //                     : Colors.blue,
// // //                 onPressed: controller != null
// // //                     ? () => onSetFlashModeButtonPressed(FlashMode.always)
// // //                     : null,
// // //               ),
// // //               IconButton(
// // //                 iconSize: 30,
// // //                 icon: Icon(Icons.highlight),
// // //                 color: controller?.value?.flashMode == FlashMode.torch
// // //                     ? Colors.orange
// // //                     : Colors.blue,
// // //                 onPressed: controller != null
// // //                     ? () => onSetFlashModeButtonPressed(FlashMode.torch)
// // //                     : null,
// // //               ),
// // //
// // //
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // // // import 'package:clockin_sg/home/home.dart';
// // // // import 'package:clockin_sg/login_resetpass_otp/create_new_password.dart';
// // // // import 'package:clockin_sg/login_resetpass_otp/loginScreen.dart';
// // // // import 'package:clockin_sg/profile/profile.dart';
// // // // import 'package:clockin_sg/provider.dart';
// // // // import 'package:clockin_sg/qr_scan.dart';
// // // // import 'package:clockin_sg/splashScreen/splashScreen.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:provider/provider.dart';
// // // // //import 'dart:html';
// // // //
// // // // // @dart=2.9
// // // // void main() {
// // // //   runApp(const MyApp());
// // // //   WidgetsFlutterBinding.ensureInitialized();
// // // // }
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   const MyApp({Key? key}) : super(key: key);
// // // //
// // // //   // This widget is the root of your application.
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MultiProvider(
// // // //       providers: [
// // // //         ChangeNotifierProvider.value(
// // // //           value: Counter(),
// // // //         ),
// // // //       ],
// // // //       child: MaterialApp(
// // // //         debugShowCheckedModeBanner: false,
// // // //         title: 'Flutter Demo',
// // // //         theme: ThemeData(
// // // //           primarySwatch: Colors.blue,
// // // //           visualDensity: VisualDensity.adaptivePlatformDensity,
// // // //         ),
// // // //         home: Splash(),
// // // //       ),
// // // //     );
// // // //
// // // //     // MaterialApp(
// // // //     //   title: 'Flutter Demo',
// // // //     //   theme: ThemeData(
// // // //     //     primarySwatch: Colors.blue,
// // // //     //   ),
// // // //     //   home:
// // // //     //       ProfileScreen(), //const MyHomePage(title: 'Flutter Demo Home Page'),
// // // //     // );
// // // //   }
// // // // }
// // // //
// // // // class MyHomePage extends StatefulWidget {
// // // //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// // // //
// // // //   final String title;
// // // //
// // // //   @override
// // // //   State<MyHomePage> createState() => _MyHomePageState();
// // // // }
// // // //
// // // // class _MyHomePageState extends State<MyHomePage> {
// // // //   int _counter = 0;
// // // //
// // // //   void _incrementCounter() {
// // // //     Navigator.push(
// // // //       context,
// // // //       MaterialPageRoute(builder: (context) => Splash()),
// // // //     );
// // // //     setState(() {
// // // //       _counter++;
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text(widget.title),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             const Text(
// // // //               'You have pushed the button this many times:',
// // // //             ),
// // // //             Text(
// // // //               '$_counter',
// // // //               style: Theme.of(context).textTheme.headline4,
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       floatingActionButton: FloatingActionButton(
// // // //         onPressed: _incrementCounter,
// // // //         tooltip: 'Increment',
// // // //         child: const Icon(Icons.add),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:camera/camera.dart';
// // // //
// // // // // List<CameraDescription>? cameras;
// // // //
// // // // // class CameraAppTest extends StatelessWidget {
// // // // //   static const routeName = '/videoRecordScreen';
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('test'),
// // // // //       ),
// // // // //       body: Container(
// // // // //         // width: 200,
// // // // //         alignment: Alignment.center,
// // // // //         // margin: EdgeInsets.all(24),
// // // // //         // padding: EdgeInsets.all(24),
// // // // //         decoration: BoxDecoration(),
// // // // //         // decoration: ,
// // // // //         child: Container(child: Demo()),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // // // class Square extends StatefulWidget {
// // // // //   final color;
// // // // //   final size;
// // // //
// // // // //   Square({this.color, this.size});
// // // //
// // // // //   @override
// // // // //   _SquareState createState() => _SquareState();
// // // // // }
// // // //
// // // // // class _SquareState extends State<Square> {
// // // // //   late CameraController controller;
// // // //
// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     controller = CameraController(cameras![0], ResolutionPreset.medium);
// // // // //     controller.initialize().then((_) {
// // // // //       if (!mounted) {
// // // // //         return;
// // // // //       }
// // // // //       setState(() {});
// // // // //     });
// // // // //   }
// // // //
// // // // //   @override
// // // // //   void dispose() {
// // // // //     controller.dispose();
// // // // //     super.dispose();
// // // // //   }
// // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     if (!controller.value.isInitialized) {
// // // // //       return Container();
// // // // //     }
// // // // //     return AspectRatio(
// // // // //         aspectRatio: controller.value.aspectRatio,
// // // // //         child: CameraPreview(controller));
// // // // //   }
// // // // // }
// // // //
// // // // // class Demo extends StatelessWidget {
// // // // //   build(context) {
// // // // //     return Container(
// // // // //       margin: EdgeInsets.only(bottom: 20, right: 20),
// // // // //       height: MediaQuery.of(context).size.height,
// // // // //       width: MediaQuery.of(context).size.width,
// // // // //       child: Stack(
// // // // //         children: [
// // // // //           Align(
// // // // //             alignment: Alignment.bottomRight,
// // // // //             child: ClipRRect(
// // // // //               borderRadius: BorderRadius.all(Radius.circular(20)),
// // // // //               child: Container(
// // // // //                 width: 200,
// // // // //                 height: 200,
// // // // //                 decoration: BoxDecoration(
// // // // //                   border: Border.all(width: 10, color: Colors.black),
// // // // //                 ),
// // // // //                 // margin: EdgeInsets.only(bottom: 30),
// // // // //                 child: Square(),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           // Square(),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // // // Future<void> main() async {
// // // // //   WidgetsFlutterBinding.ensureInitialized();
// // // // //   cameras = await availableCameras();
// // // // //   runApp(MyApp());
// // // // // }
// // // //
// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       title: 'Flutter Demo',
// // // // //       theme: ThemeData(
// // // // //         primarySwatch: Colors.blue,
// // // // //         visualDensity: VisualDensity.adaptivePlatformDensity,
// // // // //       ),
// // // // //       home: CameraAppTest(),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // // // class MyHomePage extends StatefulWidget {
// // // // //   MyHomePage({required Key key, required this.title}) : super(key: key);
// // // //
// // // // //   final String title;
// // // //
// // // // //   @override
// // // // //   _MyHomePageState createState() => _MyHomePageState();
// // // // // }
// // // //
// // // // // class _MyHomePageState extends State<MyHomePage> {
// // // // //   int _counter = 0;
// // // //
// // // // //   void _incrementCounter() {
// // // // //     setState(() {
// // // // //       _counter++;
// // // // //     });
// // // // //   }
// // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text(widget.title),
// // // // //       ),
// // // // //       body: Center(
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: <Widget>[
// // // // //             Text(
// // // // //               'You have pushed the button this many times:',
// // // // //             ),
// // // // //             Text(
// // // // //               '$_counter',
// // // // //               style: Theme.of(context).textTheme.headline4,
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //       floatingActionButton: FloatingActionButton(
// // // // //         onPressed: _incrementCounter,
// // // // //         tooltip: 'Increment',
// // // // //         child: Icon(Icons.add),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // //
// // //
