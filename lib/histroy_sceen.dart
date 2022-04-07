import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clockin_sg/comman_var/variables.dart';
import 'package:clockin_sg/profile/profile_edit.dart';
import 'package:clockin_sg/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistroyScreen extends StatefulWidget {
  const HistroyScreen({Key? key}) : super(key: key);

  @override
  State<HistroyScreen> createState() => _HistroyScreenState();
}

class _HistroyScreenState extends State<HistroyScreen> {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NAME'),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: (() {}),
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Color.fromRGBO(255, 197, 15, 1),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.cancel_sharp), onPressed: () {}),
        // ],
      ),
      body: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text('data'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Expanded(
                              child: ListView.separated(
                            shrinkWrap: false,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                            itemCount: 20,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      color: Color.fromRGBO(255, 240, 191, 1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Apr',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text('24',
                                              style: TextStyle(fontSize: 11))
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [Text('data'), Text('1234')],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 40,
                                      color: Color.fromRGBO(255, 240, 191, 1),
                                      child: Center(
                                        child: Text('A'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      )),
                )
              ],
            ),
          )),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,

      //   backgroundColor: Color.fromRGBO(255, 197, 15, 1),
      //   onPressed: () {},
      //   child: Icon(Icons.add), //icon inside button
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Color.fromRGBO(255, 197, 15, 1),
      //   shape: CircularNotchedRectangle(), //shape of notch
      //   notchMargin: 3,
      //   child: Container(
      //     height: MediaQuery.of(context).size.height * 0.08,
      //     child: Row(
      //       //mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: <Widget>[
      //         Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(
      //                 Icons.home,
      //                 color: Colors.white,
      //                 //size: 20,
      //               ),
      //               onPressed: () {},
      //             ),
      //             Text(
      //               'Home',
      //               style: TextStyle(color: Colors.white),
      //             )
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(
      //                 Icons.person,
      //                 color: Colors.white,
      //               ),
      //               onPressed: () {},
      //             ),
      //             Text('Profile', style: TextStyle(color: Colors.white))
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
