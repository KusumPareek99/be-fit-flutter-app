import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_project/screens/login_page.dart';
import 'package:mini_project/screens/homePage/home_page.dart';
import 'package:mini_project/screens/onboarding_page.dart';

class AuthController extends GetxController {
// for google sign in
var _googleSignIn = GoogleSignIn();
var googleAccount = Rx<GoogleSignInAccount?>(null);
googleLogin() async{
    googleAccount.value = await _googleSignIn.signIn(); 
}

  static AuthController instance = Get.find();
  late Rx<User?> _user;
  // email,password,name etc in user
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // our user/app will be notified if he logs in logout etc
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print('login page');
      Get.offAll(() => OnboardingPage());
    } else {
      print("welcome screen");
      Get.offAll(() => HomePage(email: user.email!,));
    }
  }

// helper function that will be called from sign up
  void register(String email, password) async {
    //  await auth.createUserWithEmailAndPassword(email: email, password: password);
    //   print("Successful sign up");
    try {
      
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      print("Successful sign up");
    } catch (e) {
      Get.snackbar("About user", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
          print("Failed signup");
    }
  }
   void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Logging in", "Succesful login",
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Success",
            style: TextStyle(color: Colors.white),
          ),);
          print("Login success");
    } catch (e) {
      Get.snackbar("About login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Log in failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
          print("login failed");
    }
  }
  void logOut() async{
    await auth.signOut();
    print("Logged out successfully");
  }
/*
  signInWithGoogle() async{
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn(); 

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken:  googleAuth.idToken,
      );

      // Once signed in, return the User Credential
      return FirebaseAuth.instance.signInWithCredential(credential) ;
  }
  */
/*
  // Determine if the user is authenticate
  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
  builder: (BuildContext context,snapshot){
    if(snapshot.hasData){
      return WelcomePage(email: auth.currentUser!.email!,);
    }else{
      return const LoginPage();
    }
  },
    );
  }

  signInWithGoogle() async{
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn(); 

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken:  googleAuth.idToken,
      );

      // Once signed in, return the User Credential
      return  await FirebaseAuth.instance.signInWithCredential(credential) ;
  }
  */


}
