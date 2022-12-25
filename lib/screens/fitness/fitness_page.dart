import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants/constants.dart';
import 'package:mini_project/screens/fitness/components/courses.dart';
import 'package:mini_project/screens/fitness/components/diff_styles.dart';
import 'package:mini_project/screens/homePage/home_page.dart';
import 'package:mini_project/screens/profile/profile_page.dart';
import 'dart:math' as math;
import 'package:mini_project/service/auth_controller.dart';

import 'components/custom_app_bar.dart';

class FitnessPage extends StatefulWidget {
  String email;
  FitnessPage({Key? key, required this.email}) : super(key: key);

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  int selectedIconIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: appPadding * 2),
        child: Column(
          children: [
            CustomAppBar(),
            DiffStyles(),
            Courses(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0x00000000),
        index: selectedIconIndex,
        buttonBackgroundColor: primary,
        height: 60.0,
        color: white,
        onTap: (index) {
          setState(() {
            selectedIconIndex = index;
          });
        },
        //animationCurve: Curves.easeInToLinear,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            email: AuthController.instance.auth.currentUser!.email!,
                          )),
                );
                print("Home Page");
              },
              child: Icon(
                Icons.home_outlined,
                size: 30,
                color: selectedIconIndex == 0 ? white : black,
              )),
          GestureDetector(
             onTap: () {
            //   //navigate to fitness page

            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => FitnessPage(
            //               email: "",
            //             )),
            //   );
            print("Fitness Page");
           },
            child: Icon(
              Icons.play_arrow_outlined,
              size: 30,
              color: selectedIconIndex == 1 ? white : black,
            ),
          ),
          GestureDetector(
            onTap: () {
              // navigate to user profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          email: "",
                        )),
              );
              print("Profile Page");
            },
            child: Icon(
              Icons.person_outline,
              size: 30,
              color: selectedIconIndex == 2 ? white : black,
            ),
          ),
        ],
      ),
    );
  }
}
