// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class Helper{
//   static void Future scanBarcodeNormal() async {
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