import 'dart:async';

import 'package:clockin_sg/login_resetpass_otp/loginScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void initState() {
    if (mounted) {
      Timer(Duration(seconds: 3), () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        // final preference = await SharedPreferences.getInstance();
        // if (preference.containsKey('token') &&
        //     preference.getString('token').isNotEmpty) {
        //   Helper.changeScreenReplace(context, MainScreen());
        // } else {
        //   Helper.changeScreenReplace(context, Landing());
        // }
      });
    }
    super.initState();
    //initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        //color: Colors.red,
        child: Image.asset(
          'lib/assets/Splash.png',
          //width: mediaQuery.size.width,
          fit: BoxFit.cover,
        ),

        // child: Image.asset(
        //   'lib/assets/Splash.png',
        //   fit: BoxFit.fitHeight,
        // ),
      ),
    );
  }
}
