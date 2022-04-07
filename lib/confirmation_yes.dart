import 'dart:async';

import 'package:clockin_sg/camera_screen.dart';
import 'package:clockin_sg/histroy_sceen.dart';
import 'package:clockin_sg/home/home.dart';
import 'package:clockin_sg/tab_controller.dart';
import 'package:clockin_sg/text_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmatonScreen extends StatefulWidget {
  const ConfirmatonScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmatonScreen> createState() => _ConfirmatonScreenState();
}

class _ConfirmatonScreenState extends State<ConfirmatonScreen> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(milliseconds: 3000), () {
    //   Navigator.push(
    //       context, CupertinoPageRoute(builder: (_) => CameraScreen()));
    // });
  }

  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: TabScreen(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 197, 15, 1),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Confirmaton',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PageView(
              //   controller: _myPage,
              //   onPageChanged: (int) {
              //     print('Page Changes to index $int');
              //   },
              //   children: <Widget>[
              //     // HomeScreen(),
              //     // HistroyScreen(),
              //     //ConfirmatonScreen()
              //   ],
              //   physics:
              //       NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: circleRadius / 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0.25), width: 1),
                        color: Color.fromRGBO(250, 250, 250, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          Text('Clock In Success',
                              style: GoogleFonts.arimo(
                                  fontSize: 20,
                                  color: Color.fromRGBO(83, 83, 83, 1))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text('31 March, 9:00AM',
                              style: GoogleFonts.arimo(
                                  fontSize: 18,
                                  color: Color.fromRGBO(83, 83, 83, 1))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text('City Name',
                              style: GoogleFonts.arimo(
                                  fontSize: 18,
                                  color: Color.fromRGBO(83, 83, 83, 1))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: circleRadius - 15,
                    height: circleRadius,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color.fromRGBO(39, 215, 11, 1)),
                    child: Padding(
                        padding: EdgeInsets.all(circleBorderWidth),
                        child: Icon(
                          Icons.join_right,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.25), width: 0),
                      borderRadius: BorderRadius.circular(16)),
                  child: SliderItem()),
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 0,

        backgroundColor: Color.fromRGBO(255, 197, 15, 1),
        onPressed: () {},
        child: Icon(Icons.add), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(255, 197, 15, 1),
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 3,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     CupertinoPageRoute(builder: (_) => HomeScreen()));
                      // setState(() {
                      //   _myPage.jumpToPage(0);
                      // });
                    },
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      //size: 20,
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.home,
                    color: Colors.transparent,
                    //size: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     CupertinoPageRoute(builder: (_) => HistroyScreen()));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ProfileScreen()),
                      // );
                    },
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Text('Profile', style: TextStyle(color: Colors.white))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
