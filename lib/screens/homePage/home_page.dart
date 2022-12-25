import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants/constants.dart';
import 'package:mini_project/screens/fitness/fitness_page.dart';
import 'package:mini_project/screens/homePage/components/activity_list.dart';

import 'package:mini_project/screens/profile/profile_page.dart';

import 'package:mini_project/service/auth_controller.dart';

import 'components/custom_app_bar.dart';

class HomePage extends StatefulWidget {
    
  String email;
  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIconIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: 
      GestureDetector(
        onTap: () {
          AuthController.instance.logOut();
        },
        child:
        Padding(
          padding: EdgeInsets.only(top: appPadding * 2),
          child: Column(
            children: [
              CustomAppBar(),
                ActivityList(),
              Center(
                child: Container(
                  width: w * 0.62,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/logo/loginbtn.png"),
                          fit: BoxFit.cover)),
                  child: const Center(
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
           
            ],
          ),
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
        // animationCurve: Curves.easeInToLinear,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          GestureDetector(
              onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => HomePage(email: "")),
              //   );
                print("Home Page");
               },
              child: Icon(
            Icons.home_outlined,
            size: 30,
            color: selectedIconIndex == 0 ? white : black,
          )),
          GestureDetector(
              onTap: () {
                //navigate to fitness page

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FitnessPage(
                            email: "",
                          )),
                );
                print("Fitness Page");
              },
              child: Icon(
                Icons.play_arrow_outlined,
                size: 30,
                color: selectedIconIndex == 1 ? white : black,
              )),
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
              )),
        ],
      ),
    );
  }
}
