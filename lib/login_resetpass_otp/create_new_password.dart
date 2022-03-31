import 'package:clockin_sg/home/home.dart';
import 'package:clockin_sg/login_resetpass_otp/reset_pasword.dart';
import 'package:clockin_sg/tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController selectenterPasswordController = TextEditingController();
  TextEditingController enterpasswordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      'Create New Password',
                      style: GoogleFonts.alef(
                          fontWeight: FontWeight.w200,
                          fontSize: 28,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    //Text('Loginlib/assets/Login.png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: selectenterPasswordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),

                                  hintText: " Enter Password",
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
                        height: MediaQuery.of(context).size.height * 0.025),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: enterpasswordConfirmController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),

                            hintText: "Confirm Number",
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 197, 15, 1)),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (_) => TabScreen()));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const HomeScreen()),
                          // );
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
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()),
                        );
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
            ),
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
                ))));
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
