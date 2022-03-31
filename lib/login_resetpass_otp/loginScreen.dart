import 'package:clockin_sg/home/home.dart';
import 'package:clockin_sg/login_resetpass_otp/reset_pasword.dart';
import 'package:clockin_sg/tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = '';
  List<String> _locations = ['', '+65', '+91', '+71', '+32']; // Option 2
  //String _selectedLocation;
  //final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController selectCountryCodeController = TextEditingController();
  TextEditingController enterMobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
            onWillPop: () async => false,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            Image.asset('lib/assets/Vector.png'),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005),
                            Image.asset('lib/assets/ClockIn.sg.png'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Image.asset('lib/assets/Login.png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(
                      "Your company" +
                          "'s"
                              'HR need to add your\n account before you can login',
                      style: GoogleFonts.alef(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color.fromRGBO(255, 197, 15, 1)),
                      textAlign: TextAlign.center,
                    ),

                    //Text('Loginlib/assets/Login.png'),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: selectCountryCodeController,
                                decoration: InputDecoration(
                                  prefixIcon: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 0,
                                    style: const TextStyle(color: Colors.black),
                                    // underline: Container(
                                    //   height: 2,
                                    //   color: Colors.deepPurpleAccent,
                                    // ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),

                                  hintText: " Select Country Code",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(.4)),
                                  //When the TextFormField is NOT on focus
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  //When the TextFormField is ON focus
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: enterMobileNumberController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mobile_off_rounded),

                            hintText: "Enter Mobile Number",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(.4)),
                            //When the TextFormField is NOT on focus
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            //When the TextFormField is ON focus
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child:
                          // GestureDetector(
                          //   onTap: () {
                          // if (dropdownValue.isEmpty) {
                          //   FlutterToastr.show(
                          //       "   pls enter Country Code   ", context,
                          //       duration: FlutterToastr.lengthLong,
                          //       position: FlutterToastr.top);
                          // } else if (enterMobileNumberController.text.isEmpty) {
                          //   FlutterToastr.show(
                          //       "   pls enter Mobile Number   ", context,
                          //       duration: FlutterToastr.lengthLong,
                          //       position: FlutterToastr.top);
                          // } else if (enterMobileNumberController.text.length !=
                          //     10) {
                          //   FlutterToastr.show(
                          //       "   pls enter 10 digit Mobile number   ",
                          //       context,
                          //       duration: FlutterToastr.lengthLong,
                          //       position: FlutterToastr.top);
                          // } else {
                          // Navigator.push(context,
                          //     CupertinoPageRoute(builder: (_) => TabScreen()));
                          //}

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const HomeScreen()),
                          // );
                          // },
                          // child:
                          ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 197, 15, 1)),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (_) => TabScreen()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.045,
                          //width: MediaQuery.of(context).size.height*0.04,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 197, 15, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset('lib/assets/Login-2.png'),
                          ),
                        ),
                      ),
                      //),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => ResetPasswordScreen()));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const ResetPasswordScreen()),
                        // );
                      },
                      child: Text(
                        'Forget Password',
                        style: GoogleFonts.alef(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color.fromRGBO(255, 197, 15, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  ],
                ),
              ),
            )),
        bottomNavigationBar: BottomAppBar(
            color: Color.fromRGBO(255, 197, 15, 1),
            elevation: 0,
            child: Container(
              //margin: EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('lib/assets/image 12.png'),
                    radius: 100,
                  ),
                ),
                ClipPath(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Color.fromRGBO(255, 197, 15, 1),
                  ),
                  clipper: CustomClipPath(),
                ),
              ]),
            )));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double width = size.width;
    double height = size.height;
    double ofset = 130.0;
    Path path = Path();
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.quadraticBezierTo(width / 2, ofset, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
