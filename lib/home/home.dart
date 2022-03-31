import 'package:clockin_sg/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //DateTime now = DateTime.now(); // 30/09/2021 15:54:30
  DateTime currentTime = new DateTime.now();
  final formatdate = DateFormat('MMMM d');
  final formattime = DateFormat('H:mm:s');
  //DateTime dateOnly = now.getDateOnly();
  late int iconTextindex;
  String dropdownValue = 'clockin.sg';
  List<String> _locations = [
    'clockin.sg',
    'clockin2.sg',
    'clockin3.sg',
    'clockin4.sg',
    'clockin5.sg',
    ''
  ];

  List<String> iconText = [
    'clockin.sg',
    'clockin2.sg',
    'clockin3.sg',
    'clockin4.sg',
    'clockin5.sg'
  ];
  late Animation<double> animation;
  late CurvedAnimation curve;
  final iconList = <IconData>[
    Icons.home,
    Icons.person,
  ];
  String result = "Hello World...!";
  Future _scanQR() async {
    try {
      String? cameraScanResult = await scanner.scan();
      setState(() {
        result =
            cameraScanResult!; // setting string result with cameraScanResult PlatformException
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  PageController _myPage = PageController(initialPage: 0);
  var list = '';
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    // final addressFlag = List.filled(3, '', growable: true);
    // addressFlag[0] = prefs.getString("name") as String;
    // addressFlag[1] = prefs.getString("contactNumber") as String;
    // addressFlag[2] = prefs.getString("addressLine1") as String;
    // setState(() {
    //   list = addressFlag[0];
    // });
    // return addressFlag;
    String? stringValue = prefs.getString('userName');
    //String? stringValueImage = prefs.getString('usesrImage');
    setState(() {
      list = stringValue!;
    });
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    //getStringValuesSF();
    Counter counter = Provider.of<Counter>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          // floatingActionButton: FloatingActionButton.extended(
          //     icon: Icon(Icons.camera_alt),
          //     onPressed: () {
          //       print(formattime.format(currentTime));
          //       print(formatdate.format(currentTime));
          //       _scanQR(); // calling a function when user click on button
          //     },
          //     label: Text("Scan")),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: (() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              }),
              child: Image.asset('lib/assets/Vector-2.png'),
            ),
            backgroundColor: Color.fromRGBO(255, 197, 15, 1),
            title: Text('Home'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Color.fromRGBO(255, 197, 15, 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          )),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropdownButton<String>(
                                  //isExpanded: true,
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 0,
                                  //hint: Text("Select Company"),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                      // iconTextindex ==
                                      //     _locations.indexOf(newValue);
                                      print(_locations.indexOf(newValue));
                                    });
                                  },
                                  items: _locations.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                                Container(
                                  height: 50,
                                  width: 80,
                                  child:
                                      // Row(
                                      //     children: iconText
                                      //         .map((item) => new Text(item))
                                      //         .toList()),
                                      Image.asset('lib/assets/Vector.png'),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Center(
                      //         child: Container(
                      //       height: MediaQuery.of(context).size.height * 0.3,
                      //       width: MediaQuery.of(context).size.width * 0.5,
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: Color.fromRGBO(255, 197, 15, 1)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(2.5),
                      //         // child: Image.file(counter.imageFile == null
                      //         //     ? Image.asset('name')
                      //         //     : counter.imageFile)
                      //       ),
                      //     )),
                      //     //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      //     Text(
                      //       'WelCome to\n' + counter.userName,
                      //       style: GoogleFonts.alef(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 18,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     ),

                      //     //
                      //   ],
                      // ),
                      ),
                )
              ],
            ),
          )),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return Stack(
    children: [
      new AlertDialog(
        //contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        title: const Text('Popup example'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello"),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Close'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('ok'),
          ),
        ],
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.height * 0.18,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.height * 0.10,
          decoration:
              BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        ),
      )
    ],
  );
}
