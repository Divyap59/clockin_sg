// import 'package:flutter/material.dart';
// //import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class QrScanScreen extends StatefulWidget {
//   const QrScanScreen({Key? key}) : super(key: key);

//   @override
//   State<QrScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<QrScanScreen> {
//   String result = "Hello World...!";
//   String location = 'Null, Press Button 30.7126031, 76.7076003';
//   String Address = 'search';
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   Future<void> GetAddressFromLatLong(Position position) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     print(placemarks);
//     Placemark place = placemarks[0];
//     Address =
//         '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//     setState(() {});
//     print(location);
//   }

//   Future _scanQR() async {
//     try {
//       String? cameraScanResult = await scanner.scan();
//       setState(() {
//         result =
//             cameraScanResult!; // setting string result with cameraScanResult
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Scanner Example In Flutter"),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Text(result), // Here the scanned result will be shown
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // if (_currentPosition != null)
//           //   Text(
//           //       "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"),
//           Text(
//             'Coordinates Points',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             location,
//             style: TextStyle(color: Colors.black, fontSize: 16),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'ADDRESS',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text('${Address}'),
//           ElevatedButton(
//               onPressed: () async {
//                 Position position = await _getGeoLocationPosition();
//                 location =
//                     'Lat: ${position.latitude} , Long: ${position.longitude}';
//                 GetAddressFromLatLong(position);
//               },
//               child: Text('Get Location'))
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//           icon: Icon(Icons.camera_alt),
//           onPressed: () {
//             _scanQR(); // calling a function when user click on button
//           },
//           label: Text("Scan")),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
