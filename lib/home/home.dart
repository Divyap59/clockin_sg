// // import 'dart:ffi';
// // import 'dart:html';
//
// import 'package:clockin_sg/provider.dart';
// import 'package:clockin_sg/qr_scan.dart';
// import 'package:clockin_sg/tab_controller.dart';
// import 'package:clockin_sg/text_slide.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
//
// import '../comman_functiom/container_clock_in.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   //DateTime now = DateTime.now(); // 30/09/2021 15:54:30
//   DateTime currentTime = new DateTime.now();
//   final formatdate = DateFormat('MMMM d');
//   final formattime = DateFormat('H:mm:s');
//   //DateTime dateOnly = now.getDateOnly();
//   int? iconTextindex;
//   String? showtwxt;
//   String dropdownValue = 'clockin.sg';
//   List<String> _locations = [
//     'clockin.sg',
//     'clockin2.sg',
//     'clockin3.sg',
//     'clockin4.sg',
//     'clockin5.sg',
//   ];
//
//   List<String> imageList = [
//     'clockin.sg',
//     'clockin2.sg',
//     'clockin3.sg',
//     'clockin4.sg',
//     'clockin5.sg'
//   ];
//   late Animation<double> animation;
//   late CurvedAnimation curve;
//   final iconList = <IconData>[
//     Icons.home,
//     Icons.person,
//   ];
//
//   String result = "Hello World...!";
//   Future _scanQR() async {
//     try {
//       String? cameraScanResult = await scanner.scan();
//       setState(() {
//         result =
//             cameraScanResult!; // setting string result with cameraScanResult PlatformException
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }
//
//   PageController _myPage = PageController(initialPage: 0);
//   var list = '';
//   save_Company_Logo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('companyName', dropdownValue);
//     prefs.setString('companyLogo', showtwxt!);
//     // prefs.setString('usesrImage', imageFile!.path);
//   }
//
//   get_Company_Logo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? companyLogo = prefs.getString('companyLogo');
//     setState(() {
//       showtwxt = companyLogo;
//     });
//     return companyLogo;
//   }
//
//   get_Company_Name() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? companyName = prefs.getString('companyName');
//     setState(() {
//       dropdownValue = companyName!;
//     });
//     return companyName;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     get_Company_Logo();
//     get_Company_Name();
//     //getStringValuesSF();
//     Counter counter = Provider.of<Counter>(context);
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//
//           // floatingActionButton: FloatingActionButton.extended(
//           //     icon: Icon(Icons.camera_alt),
//           //     onPressed: () {
//           //       print(formattime.format(currentTime));
//           //       print(formatdate.format(currentTime));
//           //       _scanQR(); // calling a function when user click on button
//           //     },
//           //     label: Text("Scan")),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 0,
//             automaticallyImplyLeading: false,
//             // GestureDetector(
//             //   onTap: (() {
//             //     showDialog(
//             //       context: context,
//             //       builder: (BuildContext context) => _buildPopupDialog(context),
//             //     );
//             //   }),
//             //   child: Image.asset('lib/assets/Vector-2.png'),
//             // ),
//             backgroundColor: Color.fromRGBO(255, 197, 15, 1),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: Container(
//                         height: 25,
//                         width: 40,
//                         child: Center(
//                           child: Text(
//                             '$showtwxt',
//                             style: TextStyle(color: Colors.black, fontSize: 7),
//                           ),
//                         )
//                         // Image.asset(
//                         //   'lib/assets/Vector.png',
//                         //   color: Color.fromRGBO(255, 197, 15, 1),
//                         // ),
//                         ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   height: MediaQuery.of(context).size.height * 0.04,
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   decoration: BoxDecoration(
//                       // border: Border.all(color: Colors.white, width: 1),
//                       // borderRadius: BorderRadius.circular(16)
//                       ),
//                   child: DropdownButton<String>(
//                     underline: Container(color: Colors.transparent),
//                     dropdownColor: Colors.black.withOpacity(0.5),
//                     //isExpanded: true,
//                     value: dropdownValue,
//                     icon: const Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.white,
//                     ),
//                     iconSize: 24,
//                     elevation: 0,
//                     //hint: Text("Select Company"),
//                     style: const TextStyle(color: Colors.white, fontSize: 18),
//                     onChanged: (String? newValue) {
//                       //main(newValue);
//                       setState(() {
//                         dropdownValue = newValue!;
//                         iconTextindex = _locations.indexOf(newValue);
//                         showtwxt = imageList[iconTextindex as int];
//                         print(showtwxt);
//                         print(_locations.indexOf(newValue));
//                       });
//                       save_Company_Logo();
//                     },
//                     items: _locations.map((location) {
//                       return DropdownMenuItem(
//                         child: new Text(
//                           location,
//                           //style: TextStyle(color: Colors.red),
//                         ),
//                         value: location,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//             //centerTitle: true,
//           ),
//           body: SafeArea(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: Color(0xE5E5E5),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           showModalBottomSheet<void>(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Container(
//                                 height: 700,
//                                 //     MediaQuery.of(context).size.height - 100,
//                                 color: Colors.amber,
//                                 child: Center(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     //mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       const Text('Modal BottomSheet'),
//                                       ElevatedButton(
//                                         child: const Text('Close BottomSheet'),
//                                         onPressed: () => Navigator.pop(context),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                           // Navigator.push(
//                           //     context,
//                           //     CupertinoPageRoute(
//                           //         builder: (_) => QrScanScreen()));
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           width: MediaQuery.of(context).size.width * 0.25,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color.fromRGBO(0, 0, 0, 0.25),
//                                   width: 1),
//                               borderRadius: BorderRadius.circular(16)),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.lock_clock_rounded),
//                               SizedBox(
//                                 height: 3,
//                               ),
//                               Text('clockIn',
//                                   style: GoogleFonts.arimo(
//                                       //fontSize: 15,
//                                       color: Colors.black))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         width: MediaQuery.of(context).size.width * 0.25,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Color.fromRGBO(0, 0, 0, 0.25), width: 1),
//                             borderRadius: BorderRadius.circular(16)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.lock_clock_rounded),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             Text('clockOut',
//                                 style: GoogleFonts.arimo(
//                                     //fontSize: 15,
//                                     color: Colors.black))
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Color.fromRGBO(0, 0, 0, 0.25), width: 1),
//                           borderRadius: BorderRadius.circular(16)),
//                       child: SliderItem()),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Recent Clock Ins',
//                         style: GoogleFonts.arimo(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: Colors.black),
//                       )),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                         child: Column(
//                       children: [
//                         CommanFunction(
//                           name: 'mohali',
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         CommanFunction(name: 'Patiala'),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         CommanFunction(name: 'Patiala'),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                       ],
//                     )),
//                   )
//                 ],
//               ),
//             ),
//           )
//
//               // Stack(
//               //   children: [
//               //     Container(
//               //       width: MediaQuery.of(context).size.width,
//               //       height: MediaQuery.of(context).size.height * 0.06,
//               //       color: Color.fromRGBO(255, 197, 15, 1),
//               //     ),
//               //     Padding(
//               //       padding: EdgeInsets.symmetric(horizontal: 30),
//               //       child: Container(
//               //           margin:
//               //               EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 0),
//               //           height: MediaQuery.of(context).size.height,
//               //           width: MediaQuery.of(context).size.width,
//               //           decoration: BoxDecoration(
//               //               color: Colors.white,
//               //               borderRadius: new BorderRadius.only(
//               //                 topLeft: const Radius.circular(20.0),
//               //                 topRight: const Radius.circular(20.0),
//               //               )),
//               //           child: Column(
//               //             children: [
//               //               Padding(
//               //                 padding: const EdgeInsets.symmetric(
//               //                     horizontal: 20, vertical: 20),
//               //                 child: Row(
//               //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //                   children: [
//               //                     DropdownButton<String>(
//               //                       //isExpanded: true,
//               //                       value: dropdownValue,
//               //                       icon: const Icon(Icons.arrow_drop_down),
//               //                       iconSize: 24,
//               //                       elevation: 0,
//               //                       //hint: Text("Select Company"),
//               //                       style: const TextStyle(
//               //                           color: Colors.black, fontSize: 20),
//               //                       onChanged: (String? newValue) {
//               //                         setState(() {
//               //                           dropdownValue = newValue!;
//               //                           // iconTextindex ==
//               //                           //     _locations.indexOf(newValue);
//               //                           print(_locations.indexOf(newValue));
//               //                         });
//               //                       },
//               //                       items: _locations.map((location) {
//               //                         return DropdownMenuItem(
//               //                           child: new Text(location),
//               //                           value: location,
//               //                         );
//               //                       }).toList(),
//               //                     ),
//               //                     Container(
//               //                       height: 50,
//               //                       width: 80,
//               //                       child:
//               //                           // Row(
//               //                           //     children: iconText
//               //                           //         .map((item) => new Text(item))
//               //                           //         .toList()),
//               //                           Image.asset('lib/assets/Vector.png'),
//               //                     )
//               //                   ],
//               //                 ),
//               //               ),
//               //             ],
//               //           )
//               //           // Column(
//               //           //   mainAxisAlignment: MainAxisAlignment.center,
//               //           //   children: [
//               //           //     Center(
//               //           //         child: Container(
//               //           //       height: MediaQuery.of(context).size.height * 0.3,
//               //           //       width: MediaQuery.of(context).size.width * 0.5,
//               //           //       decoration: BoxDecoration(
//               //           //           shape: BoxShape.circle,
//               //           //           color: Color.fromRGBO(255, 197, 15, 1)),
//               //           //       child: Padding(
//               //           //         padding: const EdgeInsets.all(2.5),
//               //           //         // child: Image.file(counter.imageFile == null
//               //           //         //     ? Image.asset('name')
//               //           //         //     : counter.imageFile)
//               //           //       ),
//               //           //     )),
//               //           //     //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
//               //           //     Text(
//               //           //       'WelCome to\n' + counter.userName,
//               //           //       style: GoogleFonts.alef(
//               //           //         fontWeight: FontWeight.w400,
//               //           //         fontSize: 18,
//               //           //       ),
//               //           //       textAlign: TextAlign.center,
//               //           //     ),
//
//               //           //     //
//               //           //   ],
//               //           // ),
//               //           ),
//               //     )
//               //   ],
//               // ),
//               )),
//     );
//   }
// }
//
// Widget _buildPopupDialog(BuildContext context) {
//   return Stack(
//     children: [
//       new AlertDialog(
//         //contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
//         title: const Text('Popup example'),
//         content: new Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Hello"),
//           ],
//         ),
//         actions: <Widget>[
//           new FlatButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             textColor: Theme.of(context).primaryColor,
//             child: const Text('Close'),
//           ),
//           FlatButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             textColor: Theme.of(context).primaryColor,
//             child: const Text('ok'),
//           ),
//         ],
//       ),
//       Positioned(
//         top: MediaQuery.of(context).size.height * 0.3,
//         left: MediaQuery.of(context).size.height * 0.18,
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.10,
//           width: MediaQuery.of(context).size.height * 0.10,
//           decoration:
//               BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
//         ),
//       )
//     ],
//   );
// }
