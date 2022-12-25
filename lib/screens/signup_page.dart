

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/screens/homePage/home_page.dart';
import 'package:mini_project/screens/login_page.dart';
import 'package:mini_project/service/auth_controller.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


final controller = Get.put(AuthController());

  final textFieldFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();  
  final TextEditingController confirmPassController = TextEditingController();
  var password='';
  var confirmPass = '';
  
  bool isHiddenPassword=true;
  bool isHiddenConfirmPassword = true;
  bool passwordMatched = false;
void _togglePasswordView() {
    setState(()  {
        isHiddenPassword = !isHiddenPassword;
       
        if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
       textFieldFocusNode.canRequestFocus = false;  
      print(isHiddenPassword);
      print(textFieldFocusNode.context);
 
    });

}
void _toggleConfirmPasswordView() {
    setState(()  {
       
        isHiddenConfirmPassword = !isHiddenConfirmPassword;
        if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
       textFieldFocusNode.canRequestFocus = false;  
      print(isHiddenConfirmPassword);
      print(textFieldFocusNode.context);
 
    });
}
void passwordConfirmMatch()async {

  var pass = passwordController.text.trim();
  var confPass = confirmPassController.text.trim();
 if(pass!=confPass){
  print("Password does not match. Please re-type again.");
 } else {
 
    passwordMatched = true;
 
  
    }
}

  @override
  Widget build(BuildContext context) {
   

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
   
    return Scaffold(
      
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.06,
             ),
              Container(
                width: w*0.5,
                height: h * 0.28,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo/storyset_signup.png"),
                        fit: BoxFit.cover)
                        ),
         
                        ),
             Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                     SizedBox(
                        height: h * 0.05,
                      ),
                       Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                            prefixIcon: Icon(Icons.account_circle_outlined,color:Color.fromARGB(255, 243, 172, 101)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                            prefixIcon: Icon(
                              Icons.email_outlined,color:Color.fromARGB(255, 243, 172, 101)                              
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Container(
                      
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        
                        controller: passwordController,
                        obscureText: isHiddenPassword,
                        onChanged: (value) {
                          password = value;
                        },
                        focusNode: textFieldFocusNode,
                        decoration: InputDecoration(
                          hintText: "Password",                            
                          hintStyle: TextStyle(
                                         fontSize: 12
                                      ),
                            prefixIcon: Icon(
                              Icons.lock_outline,color:Color.fromARGB(255, 243, 172, 101)
                            ),
                            suffixIcon: IconButton(
                              icon : isHiddenPassword ? Icon( Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                              onPressed: () {
                                
                                  _togglePasswordView();
                              }, ),
                            
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      
                    ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height:45,
                      child: TextField(
                        controller: confirmPassController,
                        obscureText: isHiddenConfirmPassword,
                        onChanged: (value) {
                          confirmPass = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            fontSize: 12
                          ),
                            prefixIcon: Icon(Icons.password_outlined,color:Color.fromARGB(255, 243, 172, 101)),
                            suffixIcon: IconButton(
                              icon : isHiddenConfirmPassword ? Icon( Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                              onPressed: () {
                                
                                  _toggleConfirmPasswordView();
                              }, ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      
                    ),
                     
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                            ],
                      ),
                    ]),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              GestureDetector(
                onTap: (){
                  passwordConfirmMatch();
                  passwordMatched ? AuthController.instance.register(emailController.text.trim(),passwordController.text.trim()) : Get.snackbar('Password Match', 'message',backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Confirm Password and Password does not match",
            style: TextStyle(color: Colors.white),
          )) ;
                 
                },
                child: Container(
                  width: w * 0.62,
                  height: h * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/logo/loginbtn.png"),
                          fit: BoxFit.cover)
                          ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(height: h*0.01,),
              Row(
    children: <Widget>[
        Expanded(
          
            child: Divider()
        ),       

        Text("  OR  ",
        style: TextStyle(color: Colors.grey[400]),),        

        Expanded(
            child: Divider()
        ),
    ]
),
              SizedBox(height: h*0.01,),
              // Obx(() {
              //   if (controller.googleAccount.value==null) return LoginPage();
              //   else return WelcomePage(email: controller.googleAccount.value?.email ?? '' );
              // }),
              SignInButtonBuilder(
                      height: 40,
                      backgroundColor: Colors.blue,
                      text: "Sign up with Google",
                      onPressed: () {
                        //AuthController.instance.signInWithGoogle();
                        controller.googleLogin();
                      },
                         image: Container(
                         
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                  image: DecorationImage(
                                  image: AssetImage(
                            "assets/images/logo/Google.png" 
                          ),
                          fit: BoxFit.cover,
                          
                           ),
                           
                           shape: BoxShape.circle,
                ),
                         
               )
            ),
                  
                SizedBox(
                height: h * 0.04,
              ),
              RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.grey[500]),
                    children: [
                      TextSpan(
                          text: "Login",
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                             
                      )
                    ]),
              ),
          
            
             
              ],
          ),
        )

    );
  }

  /*SignInButtonBuilder googleSignInButton() {
    return SignInButtonBuilder(
                      height: 40,
                      backgroundColor: Colors.blue,
                      text: "Sign up with Google",
                      onPressed: () {
                        //AuthController.instance.signInWithGoogle();
                        controller.googleLogin();
                      },
                         image: Container(
                         
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                  image: DecorationImage(
                                  image: AssetImage(
                            "assets/images/logo/Google.png" 
                          ),
                          fit: BoxFit.cover,
                          
                           ),
                           
                           shape: BoxShape.circle,
                ),
                         
               )
            );
  }*/
/*
  Container cofirmPassTextField() {
    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height:45,
                      child: TextField(
                        controller: confirmPassController,
                        obscureText: isHiddenConfirmPassword,
                        onChanged: (value) {
                          confirmPass = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            fontSize: 12
                          ),
                            prefixIcon: Icon(Icons.password_outlined,color:Color.fromARGB(255, 243, 172, 101)),
                            suffixIcon: IconButton(
                              icon : isHiddenConfirmPassword ? Icon( Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                              onPressed: () {
                                
                                  _toggleConfirmPasswordView();
                              }, ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      
                    );
  }

  Container passwordTextField() {
    return Container(
                      
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        
                        controller: passwordController,
                        obscureText: isHiddenPassword,
                        onChanged: (value) {
                          password = value;
                        },
                        focusNode: textFieldFocusNode,
                        decoration: InputDecoration(
                          hintText: "Password",                            
                          hintStyle: TextStyle(
                                         fontSize: 12
                                      ),
                            prefixIcon: Icon(
                              Icons.lock_outline,color:Color.fromARGB(255, 243, 172, 101)
                            ),
                            suffixIcon: IconButton(
                              icon : isHiddenPassword ? Icon( Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                              onPressed: () {
                                
                                  _togglePasswordView();
                              }, ),
                            
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      
                    );
  }

  Container emailTextField() {
    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                            prefixIcon: Icon(
                              Icons.email_outlined,color:Color.fromARGB(255, 243, 172, 101)                              
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    );
  }

  Container nameTextField() {
    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                          height: 45,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                            prefixIcon: Icon(Icons.account_circle_outlined,color:Color.fromARGB(255, 243, 172, 101)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    );
  }

  Container signupLogo(double w, double h) {
    return Container(
                width: w*0.5,
                height: h * 0.28,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo/storyset_signup.png"),
                        fit: BoxFit.cover)
                        ),
         
                        );
  }
*/
   
}