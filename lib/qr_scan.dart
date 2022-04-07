import 'package:clockin_sg/confirmation_no.dart';
import 'package:clockin_sg/confirmation_yes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<QrScanScreen> {
  String result = "Hello World...!";
  String location = 'Null, Press Button 30.7126031, 76.7076003';
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
    print(location);
  }

  Future<String>? sacnqr;
  Future _scanQR() async {
    try {
      String? cameraScanResult = await scanner.scan();
      setState(() {
        result =
            cameraScanResult!; // setting string result with cameraScanResult
      });

      Navigator.push(
          context, CupertinoPageRoute(builder: (_) => ConfirmatonScreen()));
    } on PlatformException catch (e) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (_) => ConfirmationNoScreen()));

      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scanQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Scan Clockin QR code"),
        ),
        body: Text('')
        // Column(
        //   children: [
        //     // Container(
        //     //   child: sacnqr=scanner.scan(),
        //     // ),

        //     Center(
        //       child: Text(result), // Here the scanned result will be shown
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     // if (_currentPosition != null)
        //     //   Text(
        //     //       "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"),
        //     Text(
        //       'Coordinates Points',
        //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       location,
        //       style: TextStyle(color: Colors.black, fontSize: 16),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       'ADDRESS',
        //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text('${Address}'),
        //     ElevatedButton(
        //         onPressed: () async {
        //           Position position = await _getGeoLocationPosition();
        //           location =
        //               'Lat: ${position.latitude} , Long: ${position.longitude}';
        //           GetAddressFromLatLong(position);
        //         },
        //         child: Text('Get Location'))
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton.extended(
        //     icon: Icon(Icons.camera_alt),
        //     onPressed: () {
        //       _scanQR(); // calling a function when user click on button
        //     },
        //     label: Text("Scan")),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}

//import 'package:barcode_scan/barcode_scan.dart';
// import 'package:clockin_sg/confirmation_yes.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter/material.dart';

// //import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// class ScanPage extends StatefulWidget {
//   @override
//   _ScanPageState createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   String? scanBarcode;
//   bool backCamera = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     scanBarcodeNormal();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //scanBarcodeNormal();
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Scan using:" + (backCamera ? "Front Cam" : "Back Cam")),
//           actions: <Widget>[
//             IconButton(
//               icon: backCamera ? Icon(Icons.camera_alt) : Icon(Icons.camera),
//               onPressed: () {
//                 setState(() {
//                   backCamera = !backCamera;
//                   camera = backCamera ? 1 : -1;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.abc),
//               onPressed: () {
//                 scanBarcodeNormal();
//               },
//             )
//           ],
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               Text(
//                 (scanBarcode == null) || (scanBarcode == "")
//                     ? "Please Scan to show some result"
//                     : "Result:" + scanBarcode!,
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
//               ),
//             ],
//           ),
//         ));
//   }

//   Future scanBarcodeNormal() async {
//     String barcodeScanRes;

//     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         "#ff6666", "Cancel", true, ScanMode.QR);
//     print(barcodeScanRes);

//     setState(() {
//       scanBarcode = barcodeScanRes;
//     });
//     Navigator.push(
//         context, CupertinoPageRoute(builder: (_) => ConfirmatonScreen()));
//   }
// }

// int camera = 1;
