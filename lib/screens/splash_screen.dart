import 'dart:async';


import 'package:flutter/material.dart';

import 'package:mini_project/screens/login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState(){

  super.initState();

  // Timer(Duration(seconds:5), 
  // () => Navigator.pushReplacement(context,
  //  MaterialPageRoute(builder:
  //   (context)=>LoginPage()
  //   )
  // )
  // );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
              colors: [Color(0xFFF58434),Color(0xFFEC2690),]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                              "assets/images/logo/app_logo.png" 
                            ),
                            fit: BoxFit.cover,
                            
                             ),
                             shape: BoxShape.circle
                  ),
                ),
                SizedBox(
                  height:100,
                ),
                
                // Image.asset(
                //   "assets/images/logo/app_logo.png",
                //   height: 300.0,
                //   width: 300.0,
                  
                //   ),
                   Text(
                "Be.Fit.\nStay Fit. Stay Healthy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
                ),
                
              ],
            ),
             
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                )
          ],
        
        ),
        
        
      ),
      
    );
  }
}