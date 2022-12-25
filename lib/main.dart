import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mini_project/screens/homePage/home_page.dart';
import 'package:mini_project/screens/login_page.dart';
import 'package:mini_project/screens/onboarding_page.dart';
import 'package:mini_project/service/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'screens/splash_screen.dart';

 int ?initScreen;

Future<void> main() async {
  

  // to hide the upper bar of system ui
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  // to bind auth with app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value)=> Get.put(AuthController()));

SharedPreferences preferences = await SharedPreferences.getInstance();
 initScreen = await preferences.getInt('initScreen');  
  await preferences.setInt('initScreen', 1);
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Be Fit App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       fontFamily: 'Poppins',
       primarySwatch: Colors.orange
        
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' :'login' ,
      routes: {
        'login' : (context) => LoginPage(),
        'onboard' : (context) => OnboardingPage(),
      },
    // home:OnboardingPage(),
    );
  }
}

