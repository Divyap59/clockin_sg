import 'dart:async';
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:healthcare/GlobleFunc/globleClass.dart';
// import 'package:healthcare/Model/loginM.dart';
// import 'package:healthcare/ProviderClass/providerclass.dart';
// import 'package:healthcare/Screens/bottomTabBar/bottomNavigationBar.dart';
// import 'package:healthcare/Screens/createPasswordController/createPasswordScreen.dart';
// import 'package:healthcare/Views/RequredFieldPopUp.dart';
// import 'package:healthcare/reuseWidget/verifiedpopup.dart';
// import 'package:healthcare/reuseWidget/widgetReuse.dart';
// import 'package:healthcare/serviceManager/servicemanager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  //final String verification_token;
  final bool isResetPassword;
  final String emailAddress;
  OtpScreen(this.isResetPassword, this.emailAddress);
  @override
  _OtpScreenState createState() =>
      _OtpScreenState(isResetPassword, emailAddress);
}

class _OtpScreenState extends State<OtpScreen> {
  // final String verification_token;
  // final bool isResetPassword;
  //  final String emailAddress;
  //_OtpScreenState(this.verification_token, this.isResetPassword,this.emailAddress);

  TextEditingController firstTextController = new TextEditingController();
  TextEditingController secondTextController = new TextEditingController();
  TextEditingController thirdTextController = new TextEditingController();
  TextEditingController fourthTextController = new TextEditingController();
  FocusNode f0 = new FocusNode();
  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();
  bool startTimer = false;
  //Timer _timer;
  int _start = 59;
  String resendTimer = "00 sec";

  _OtpScreenState(bool isResetPassword, String emailAddress);

  // _ontap_button(String btn_text) {
  //   if (btn_text == "Confirm") {
  //     if (firstTextController.text == "" ||
  //         secondTextController.text == "" ||
  //         thirdTextController.text == "" ||
  //         fourthTextController.text == "") {
  //       //
  //     } else {
  //       var param = {
  //         // Parametrer_Name().verification_token:
  //         //     verification_token, //"e0f7c4ba0e1aff8da6b2f839a7281740",
  //         "otp": firstTextController.text.trim() +
  //             secondTextController.text.trim() +
  //             thirdTextController.text.trim() +
  //             fourthTextController.text.trim()
  //       };
  //       ServiceManager()
  //           .CallApiWith_header(
  //               API_Name().verifyOtp, context, true, param, true)
  //           .then((response) async {
  //         Provider.of<UserProvider>(navigatorKey.currentContext, listen: false)
  //             .setLoader(false);
  //         var tojson = json.decode(response.body);
  //         if (tojson["status"] == 200) {
  //           if (isResetPassword) {
  //             show_success_Alert(navigatorKey.currentContext, tojson["message"],
  //                 CreatePasswordScreen(tojson["changePassword_token"]));
  //           } else {
  //             try {
  //               userProfileData = LoginModel.fromJson(tojson);
  //               SharedPreferences prefs = await SharedPreferences.getInstance();
  //               prefs.setString(share_prefrence_key().user_info, response.body);
  //               prefs.setBool(share_prefrence_key().auto_login, true);
  //               _show_success_Alert(navigatorKey.currentContext,
  //                   "you are register successfully");
  //               if (_timer != null) {
  //                 _timer.cancel();
  //               }
  //               startTimer = false;
  //               resendTimer = "00 sec";
  //               _start = 59;
  //               Future.delayed(Duration(seconds: 2), () {
  //                 Route route = MaterialPageRoute(
  //                     builder: (context) =>
  //                         userProfileData.user.role == "patient"
  //                             ? BottomMenu()
  //                             : DoctorBottomMenu());
  //                 Navigator.pop(context);
  //                 Navigator.pushReplacement(context, route);
  //               });
  //             } catch (err) {
  //               show_OTP_Alert(context, tojson["message"], tojson["token"],
  //                   CreatePasswordScreen(verification_token));
  //             }
  //           }
  //         } else {
  //           showInternetAlert(navigatorKey.currentContext, tojson["message"]);
  //           if (_timer != null) {
  //             _timer.cancel();
  //           }
  //           startTimer = false;
  //           resendTimer = "00 sec";
  //           _start = 59;
  //         }
  //       });
  //     }
  //   } else {
  //     // other button
  //   }
  // }

  // Widget _show_success_Alert(BuildContext context, alertString) {
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (_) => VerifiedPopup(),
  //   // );
  // }

  getTimer() {
    // if (startTimer == true) {
    //   const oneSec = const Duration(seconds: 1);
    //   _timer = new Timer.periodic(
    //     oneSec,
    //     (Timer timer) {
    //       if (_start == 0) {
    //         setState(() {
    //           timer.cancel();
    //           startTimer = false;
    //           resendTimer = "00 sec";
    //           _start = 59;
    //         });
    //       } else {
    //         setState(() {
    //           _start--;
    //           resendTimer = "${_start.toString()} sec";
    //         });
    //       }
    //     },
    //   );
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      startTimer = true;
    });
    getTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        //backgroundColor: Color(get_hex_Color(getColor().whitecolor)),
        body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    SafeArea(
                      top: true,
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.12),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Verify your email",
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Please enter the 4 digit code sent to",
                                        ),
                                        RichText(
                                          text: new TextSpan(
                                            text: 'your email ',
                                            style: TextStyle(
                                              fontFamily: "TT Norms",
                                              fontWeight: FontWeight.normal,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.014,
                                              color: Colors.lightBlue[200],
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'emailAddress}',
                                                style: TextStyle(
                                                    fontFamily: "TT Norms",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.016,
                                                    color: Colors.amberAccent),
                                              ),
                                              // )),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                  children: [
                                    /////// first text field

                                    firstTextFieldController(),

                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),

                                    /////// second text field

                                    secondTextFieldController(),

                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),

                                    /////// third text field

                                    thirdTextFieldController(),

                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),

                                    /////// fourth text field

                                    fourthTextFieldController(),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),

                                ////// show time field
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        Text('data')
                                      ],
                                    ),
                                    resendOtpButton()
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.45),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SafeArea(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        _bottomButtons("Confirm", Colors.white,
                                            Colors.purple, FontWeight.bold),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.013,
                                        ),
                                        // _bottomButtons(
                                        //     "Change Email",
                                        //     Color(get_hex_Color("#1FA0BD")),
                                        //     Colors.transparent,
                                        //     FontWeight.bold),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SafeArea(child: _backButton()),
                    // userProvider.getLoader == true
                    //     ? Container(
                    //         height: MediaQuery.of(context).size.height,
                    //         width: MediaQuery.of(context).size.width,
                    //         child: Center(
                    //           child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(get_hex_Color("#1FA0BD")))),
                    //         ),
                    //       )
                    //     : Offstage()
                  ],
                )
                //     ),
                //   ),
                )));
  }

  // bottom buttons
  Widget _bottomButtons(
      String lbltxt, Color txtcolor, Color bgcolor, FontWeight fontweight) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: GestureDetector(
        onTap: () {
          //_ontap_button(lbltxt);
        },
        child: Container(
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(18)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text('data'),
            //MediaQuery.of(context).size.height * 0.018),
          ),
        ),
      ),
    );
  }

  Widget resendOtpButton() {
    return GestureDetector(
      onTap: () {
        if (startTimer == true) {
          //
        } else {
          setState(() {
            startTimer = true;
          });
          getTimer();
          // ServiceManager()
          //     .CallApiWith_header(
          //         API_Name().resendOtp,
          //         context,
          //         true,
          //         {
          //           "verification_token": verification_token,
          //         },
          //         true)
          //     .then((response) async {
          //   Provider.of<UserProvider>(navigatorKey.currentContext,
          //           listen: false)
          //       .setLoader(false);
          //   var tojson = json.decode(response.body);
          //   if (tojson["status"] == 200) {
          //     showDialog(
          //       context: context,
          //       builder: (_) => CustomPopUp(tojson["message"], false, () {
          //         Navigator.pop(navigatorKey.currentContext);
          //       }, () {}),
          //     );
          //   } else {
          //     showInternetAlert(navigatorKey.currentContext, tojson["message"]);
          //   }
          // });
        }
      },
      child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
          child: Text('data')
          // lblWidget(
          //     "Resend Code",
          //     FontWeight.normal,
          //     "TT Norms",
          //     startTimer == true
          //         ? Color(get_hex_Color("#1FA0BD")).withOpacity(0.3)
          //         : Color(get_hex_Color("#1FA0BD")),
          //     MediaQuery.of(context).size.height * 0.014),
          ),
    );
  }

  Widget firstTextFieldController() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(16)),
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
              color: Colors.purple, borderRadius: BorderRadius.circular(16)),
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
              color: Colors.purple, borderRadius: BorderRadius.circular(16)),
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
              color: Colors.purple, borderRadius: BorderRadius.circular(16)),
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

  Widget _backButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: GestureDetector(
        onTap: () {
          // popToController();
          // if (_timer != null) {
          //   _timer.cancel();
          // }
        },
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(16)),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.height * 0.07,
            child: Center(
              child: Text("assets/back.svg"),
            ),
          ),
        ),
      ),
    );
  }
}
