import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:clockin_sg/login_resetpass_otp/loginScreen.dart';
import 'package:clockin_sg/profile/profile.dart';
import 'package:clockin_sg/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../constent.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? imageFile;

  void _openCamera(BuildContext context, ImageSource imageType) async {
    //try {
    //   final photo = await ImagePicker().pickImage(source: imageType);
    //   if (photo == null) return;
    //   final tempImage = File(photo.path);
    //   print(tempImage);
    //   setState(() {
    //     imageFile = tempImage;
    //   });
    // } catch (error) {
    //   debugPrint(error.toString());
   // }

    // final pickedFile = await ImagePicker().getImage(
    //   source: imageType,
    // );
    // setState(() {
    //   imageFile = File(pickedFile!.path);
    // });

    Navigator.pop(context);
  }

  // void _openGallery(BuildContext context) async {
  //   // ignore: deprecated_member_use
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //   );
  //   setState(() {
  //     imageFile = File(pickedFile!.path);
  //   });

  //   Navigator.pop(context);
  //   //File imagefile = File(imageFile);
  // }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Color.fromRGBO(255, 197, 15, 1)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context, ImageSource.gallery);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Color.fromRGBO(255, 197, 15, 1),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context, ImageSource.camera);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera_alt,
                      color: Color.fromRGBO(255, 197, 15, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _incrementCounter(
    BuildContext context,
    image,
    enterNameController,
    enterCountryCodeController,
    enterMobileNumberController,
  ) {
    Provider.of<Counter>(context, listen: false).editProfileData(
        image,
        enterNameController.toString(),
        enterCountryCodeController.toString(),
        enterMobileNumberController.toString());
  }

  save_Name_Number_image() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', enterNameController.text);
    prefs.setString('countryCode', selectCountryCodeController.text);
    prefs.setString('userMobileNum', enterMobileNumberController.text);
    // String imageFileEncode = base64Encode(imageFile!.readAsBytesSync());
    // return prefs.setString("usesrImage", imageFileEncode);
    //prefs.setString('usesrImage', imageFile!.path);
  }

  get_User_Name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? userName = prefs.getString('userName');
    setState(() {
      //enterNameController.text = userName!;
    });
    get_country_code();
    return userName;
  }

  get_country_code() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? countryCode = prefs.getString('countryCode');
    setState(() {
      //enterCountryCodeController.text = countryCode!;
    });
    return countryCode;
  }

  get_mobile_number() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? userMobileNum = prefs.getString('userMobileNum');
    setState(() {
      //enterMobileNumberController.text = userMobileNum!;
    });
    return userMobileNum;
  }

  get_image() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? usesrImage = prefs.getString('usesrImage');
    setState(() {
      imageFile = usesrImage! as File?;
    });
    return usesrImage;
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   saveNameNumber();
  // }

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    get_User_Name();
    // get_country_code();
    // get_image();
    // get_mobile_number();
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: (() {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => ProfileScreen()));
              }),
              child: Image.asset('lib/assets/Vector-2.png'),
            ),
            backgroundColor: Color.fromRGBO(255, 197, 15, 1),
            title: Text('Profile',
                style: GoogleFonts.alef(
                  //decoration: TextDecoration.underline,
                  //fontWeight: FontWeight.w400,
                  fontSize: 20,
                  //color: Color.fromRGBO(255, 197, 15, 1)
                ),
                textAlign: TextAlign.center),
            centerTitle: true,
            // actions: [
            //   IconButton(icon: Icon(Icons.cancel_sharp), onPressed: () {}),
            // ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: Color.fromRGBO(255, 197, 15, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 0, top: 6, right: 0, bottom: 0),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0),
                              )),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    shape:
                                        BoxShape.circle, //color: Colors.red),
                                    color: Color.fromRGBO(255, 197, 15, 1)),
                                child: Center(
                                    child: ClipOval(
                                        child: SizedBox.fromSize(
                                            size: Size.fromRadius(
                                                58), // Image radius
                                            child: imageFile != null
                                                ? Image.file(
                                                    imageFile!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Center(
                                                    child: Text('Select pic'),
                                                  )))),
                              )),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Column(
                                  children: [
                                    TextFormField(
                                        // onFieldSubmitted: (value) {
                                        //   enterNameController.text.isEmpty
                                        //       ? counter.userName
                                        //       : enterNameController;
                                        // },
                                        keyboardType: TextInputType.name,
                                        controller: enterNameController,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person,
                                              color: Color.fromRGBO(
                                                  255, 197, 15, 1)),

                                          hintText: "Enter Name",
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.4)),
                                          //When the TextFormField is NOT on focus
                                          // enabledBorder: UnderlineInputBorder(
                                          //   borderSide:
                                          //       BorderSide(color: Colors.black),
                                          // ),
                                          //When the TextFormField is ON focus
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 197, 15, 1)),
                                          ),
                                        )),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
                                    TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: selectCountryCodeController,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                              Icons.wordpress_outlined,
                                              color: Color.fromRGBO(
                                                  255, 197, 15, 1)),

                                          hintText: "Country Code",
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.4)),
                                          //When the TextFormField is NOT on focus
                                          // enabledBorder: UnderlineInputBorder(
                                          //   borderSide:
                                          //       BorderSide(color: Colors.black),
                                          // ),
                                          //When the TextFormField is ON focus
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 197, 15, 1)),
                                          ),
                                        )),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
                                    TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: enterMobileNumberController,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                              Icons.wordpress_outlined,
                                              color: Color.fromRGBO(
                                                  255, 197, 15, 1)),

                                          hintText: "Mobile Number",
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.4)),
                                          //When the TextFormField is NOT on focus
                                          // enabledBorder: UnderlineInputBorder(
                                          //   borderSide:
                                          //       BorderSide(color: Colors.black),
                                          // ),
                                          //When the TextFormField is ON focus
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 197, 15, 1)),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(255, 197, 15, 1)),
                                  ),
                                  onPressed: (() {
                                    save_Name_Number_image();
                                    Provider.of<Counter>(context, listen: false)
                                        .editProfileData(
                                            imageFile,
                                            enterNameController.text.toString(),
                                            selectCountryCodeController.text
                                                .toString(),
                                            enterMobileNumberController.text
                                                .toString());
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => LoginScreen()),
                                    // );
                                  }),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 197, 15, 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text('Save',
                                          style: GoogleFonts.alef(
                                              //decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Colors.white),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                            ],
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.07,
                          right: MediaQuery.of(context).size.width * 0.25,
                          child: GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
