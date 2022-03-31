import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clockin_sg/comman_var/variables.dart';
import 'package:clockin_sg/profile/profile_edit.dart';
import 'package:clockin_sg/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> list = [
    'Profile',
    'About us',
    'Histroy',
    'Setting',
    'Reset Password',
    'Logout'
  ];
  final iconList = <IconData>[
    Icons.person_add_alt_rounded,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.person,
    Icons.person_add_alt_rounded,
    Icons.brightness_4,
  ];

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (() {}),
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Color.fromRGBO(255, 197, 15, 1),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cancel_sharp), onPressed: () {}),
        ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height * 0.15,
                          //color: Colors.red,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.file(
                                      counter.imageFile!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                child: Container(
                                  //height: MediaQuery.of(context).size.height * 0.1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(counter.userName,
                                          style: GoogleFonts.alef(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black)),
                                      Text(
                                          counter.userCountryCode +
                                              '  ' +
                                              counter.userMobileNumber,
                                          style: GoogleFonts.alef(
                                              //fontWeight: FontWeight.w100,
                                              fontSize: 18,
                                              color: Colors.black)),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.007),
                                      GestureDetector(
                                        onTap: (() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileEditScreen()),
                                          );
                                        }),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Edit Profile',
                                              style: GoogleFonts.alef(
                                                  //fontWeight: FontWeight.w100,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ))),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        Expanded(
                            child: Container(
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 18),
                                    child: Icon(iconList[index]),
                                  ),
                                  Text(
                                    list[index],
                                    style: GoogleFonts.alef(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 20,
                                        color: Colors.black),
                                  )
                                ],
                              );
                            },
                          ),
                        ))
                      ],
                    ),
                  ),
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
