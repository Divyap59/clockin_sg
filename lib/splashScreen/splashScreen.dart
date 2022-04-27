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

    return Scaffold(
      body:
          // Container(     https://picsum.photos/id/237/200/300
          //   constraints: BoxConstraints.expand(),
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("lib/assets/Splash.png"), fit: BoxFit.cover),
          //   ),

          Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        color: Colors.red,
        child: Image.asset(
          "lib/assets/image 12.png",
          width: mediaQuery.size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
