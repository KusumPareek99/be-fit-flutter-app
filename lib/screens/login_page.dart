import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/service/auth_controller.dart';
import 'package:mini_project/screens/signup_page.dart';
// #1e0010 : brown
// #ec268f : pink
// #f58634 : orange
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textFieldFocusNode = FocusNode();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   bool isHiddenPassword=true;
   void _togglePasswordView() {
    setState(()  {
        isHiddenPassword = !isHiddenPassword;
       
        if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
       textFieldFocusNode.canRequestFocus = false;  
      print(isHiddenPassword);
      print(textFieldFocusNode.context);
 
    });
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
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                  width: w,
                  height: h * 0.3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:  AssetImage("assets/images/logo/undraw_Meditation_Pink.png"),
                          fit: BoxFit.cover))),
                      Center(
                        child: Text(
                          "Be.Fit.",
                          style:
                              TextStyle(fontSize: 50, fontWeight: FontWeight.w600,color: Color(0xFFF58434)),
                        ),
                      ),
                      
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 5,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                            height:60,
                        child: TextField(
                           controller: emailController,
                          decoration: InputDecoration(
                             hintText: "Email ID",
                              prefixIcon: Icon(Icons.email_outlined,color:Color(0xFFF58434)),
                           
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
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
                            height: 60,
                        child: TextField(
                              controller:passwordController,
                              obscureText: isHiddenPassword,
                              focusNode: textFieldFocusNode,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password_outlined,color:Color(0xFFF58434)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text(
                            "Forgot your Password?",
                            style:
                                TextStyle(fontSize: 15, color: Color(0xFFF58434)),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              GestureDetector(
                onTap: (){
                  AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                },
                child: Container(
                  width: w * 0.62,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/logo/loginbtn.png"),
                          fit: BoxFit.cover)
                          ),
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.1,
              ),
              RichText(
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.grey[500]),
                    children: [
                      TextSpan(
                          text: "Create",
                          style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFF58434),
                          fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap=()=> Get.to(()=>const SignUpPage())
                             
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
