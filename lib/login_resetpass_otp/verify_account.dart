import 'package:clockin_sg/login_resetpass_otp/create_new_password.dart';
import 'package:clockin_sg/login_resetpass_otp/loginScreen.dart';
import 'package:clockin_sg/otp_verifiction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_autofill/otp_autofill.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  // List countryData = ["1", '2', '3', '4', '5'];
  String otpEntered = '';
  //final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController resetPasswodController = TextEditingController();
  TextEditingController firstTextController = new TextEditingController();
  TextEditingController secondTextController = new TextEditingController();
  TextEditingController thirdTextController = new TextEditingController();
  TextEditingController fourthTextController = new TextEditingController();
  FocusNode f0 = new FocusNode();
  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();

  Widget firstTextFieldController() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(255, 197, 15, 1), width: 1),
              borderRadius: BorderRadius.circular(16)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            focusNode: f0,
            controller: firstTextController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (firstTextController.text.length > 1) {
                String replaceText = "";
                replaceText = firstTextController.text[1];
                firstTextController.text = replaceText;
                f1.requestFocus();
              } else {
                if (firstTextController.text.length > 0) {
                  f1.requestFocus();
                } else {}
              }
            },
          )),
    );
  }

  Widget secondTextFieldController() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(255, 197, 15, 1), width: 1),
              borderRadius: BorderRadius.circular(16)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            focusNode: f1,
            controller: secondTextController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (secondTextController.text.length > 1) {
                String replaceText = "";
                replaceText = secondTextController.text[1];
                secondTextController.text = replaceText;

                f2.requestFocus();
              } else {
                if (secondTextController.text.length > 0) {
                  f2.requestFocus();
                } else {
                  f0.requestFocus();
                }
              }
            },
          )),
    );
  }

  Widget thirdTextFieldController() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(255, 197, 15, 1), width: 1),
              borderRadius: BorderRadius.circular(16)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            focusNode: f2,
            controller: thirdTextController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (thirdTextController.text.length > 1) {
                String replaceText = "";
                replaceText = thirdTextController.text[1];
                thirdTextController.text = replaceText;
                print(thirdTextController.text);
                f3.requestFocus();
              } else {
                if (thirdTextController.text.length > 0) {
                  f3.requestFocus();
                } else {
                  f1.requestFocus();
                }
              }
            },
          )),
    );
  }

  Widget fourthTextFieldController() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(255, 197, 15, 1), width: 1),
              //color: Color.fromRGBO(255, 197, 15, 1),
              borderRadius: BorderRadius.circular(16)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            focusNode: f3,
            controller: fourthTextController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (fourthTextController.text.length > 1) {
                String replaceText = "";
                replaceText = fourthTextController.text[1];
                fourthTextController.text = replaceText;
                f3.unfocus();
              } else {
                if (fourthTextController.text.length > 0) {
                  f3.unfocus();
                } else {
                  f2.requestFocus();
                }
              }
            },
          )),
    );
  }

  //TextEditingController enterMobileNumberController = TextEditingController();
  final scaffoldKey = GlobalKey();
  late OTPTextEditController controller;
  late OTPInteractor _otpInteractor;
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _otpInteractor
        .getAppSignature()
        //ignore: avoid_print
        .then((value) => print('signature - $value'));

    controller = OTPTextEditController(
      codeLength: 5,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{5})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          //SampleStrategy(),
        ],
      );
  }

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Image.asset('lib/assets/Verify Account.png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(
                      'Mobile Verification has\n Successfully done',
                      style: GoogleFonts.alef(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color.fromRGBO(255, 197, 15, 1)),
                      textAlign: TextAlign.center,
                    ),

                    //Text('Loginlib/assets/Login.png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      'We have send the top on 8887776660\nwill apply auto to the fields',
                      style: GoogleFonts.alef(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Image.asset(
                    //     'lib/assets/We will send you one time password(OPT).png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              firstTextFieldController(),
                              secondTextFieldController(),
                              thirdTextFieldController(),
                              fourthTextFieldController()
                            ],
                          )),
                    ),

                    // Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 35),
                    //     child: PinEntryTextField(
                    //       onSubmit: (String pin) {
                    //         setState(() {
                    //           otpEntered = pin;
                    //         });
                    //       },
                    //       lastPin: '',
                    //     )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                    RichText(
                      text: TextSpan(
                        text: "if you did" + "'t" " receive a code",
                        style: GoogleFonts.alef(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 18,
                        ),
                        //textAlign: TextAlign.center,
                        children: <TextSpan>[
                          TextSpan(
                            text: '!',
                            style: GoogleFonts.alef(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          TextSpan(
                            onEnter: (event) {},
                            text: ' Resend',
                            style: GoogleFonts.alef(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Color.fromRGBO(255, 197, 15, 1)),
                          ),
                        ],
                      ),
                    ),
                    //Text("don" + "'t'"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 197, 15, 1)),
                        ),
                        onPressed: () {
                          if (firstTextController.text.isEmpty ||
                              secondTextController.text.isEmpty ||
                              thirdTextController.text.isEmpty ||
                              fourthTextController.text.isEmpty) {
                            FlutterToastr.show("pls enter OTP", context,
                                duration: FlutterToastr.lengthLong,
                                position: FlutterToastr.top);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNewPasswordScreen()),
                            );
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 197, 15, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset('lib/assets/Verify.png'),
                          ),
                        ),
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

  @override
  Future<void> dispose() async {
    await controller.stopListen();
    super.dispose();
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
