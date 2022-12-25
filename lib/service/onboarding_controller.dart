import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mini_project/model/onboarding_info.dart';
import 'package:mini_project/screens/homePage/home_page.dart';
import 'package:mini_project/screens/login_page.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
      
      // Navigator.push(MaterialPageRoute(builder: (_)=>HomePage(email:"") ));
       Get.offAll(() => LoginPage());          
    } else{
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/onboarding/onboarding.png', 'Start your morning with Yoga',
        'A refreshing beginning of the day'),
    OnboardingInfo('assets/images/onboarding/onboarding_2.png', 'Track your progress',
        'Grow bit by bit'),
    OnboardingInfo('assets/images/onboarding/onboarding_3.png', 'The future of healthy lifestyle',
        'Let\'s begin')
  ];
}
