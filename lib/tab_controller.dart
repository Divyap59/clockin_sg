import 'package:clockin_sg/confirmation_yes.dart';
import 'package:clockin_sg/histroy_sceen.dart';
import 'package:clockin_sg/home/home.dart';
import 'package:clockin_sg/profile/profile_edit.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        highlightElevation: 10,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 197, 15, 1),
        onPressed: () {},
        child: Icon(Icons.add), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(255, 197, 15, 1),
        shape: CircularNotchedRectangle(), //shape of notch
        //notchMargin: 3,
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
                      setState(() {
                        _myPage.jumpToPage(0);
                      });
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
                      setState(() {
                        _myPage.jumpToPage(1);
                      });
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
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          //HomeScreen(),
          ProfileEditScreen()
          //HistroyScreen(),
          //ConfirmatonScreen()
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
    );
  }
}
//   int _index = 0;
//   final List<Widget> _children = [
//     HomeScreen(),
//     Center(
//       child: Text("Second Page"),
//     ),
//     ProfileEditScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: (_children[_index]),
//       ),

//       floatingActionButton: FloatingActionButton(
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(255, 197, 15, 1),
//         onPressed: () {},
//         child: Icon(Icons.add), //icon inside button
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         //onTap: onTabTapped,
//         color: Color.fromRGBO(255, 197, 15, 1),
//         shape: CircularNotchedRectangle(), //shape of notch
//         notchMargin: 3,
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.08,
//           child: Row(
//             //mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         // _myPage.jumpToPage(0);
//                       });
//                     },
//                     child: Icon(
//                       Icons.home,
//                       color: Colors.white,
//                       //size: 20,
//                     ),
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Icon(
//                     Icons.home,
//                     color: Colors.transparent,
//                     //size: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Add',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         //_myPage.jumpToPage(1);
//                       });
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => ProfileScreen()),
//                       // );
//                     },
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text('Profile', style: TextStyle(color: Colors.white))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   onTap: onTabTapped,
//       //   currentIndex: 0,
//       //   items: [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.looks_one),
//       //       label: 'First',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.looks_two),
//       //       label: 'Second',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.looks_3),
//       //       label: 'Third',
//       //     )
//       //   ],
//       // ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _index = index;
//     });
//   }
// }
