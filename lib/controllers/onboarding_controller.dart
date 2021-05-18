import 'package:flutter/material.dart';
import 'package:flutter_zomato/models/onboarding_info.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var onBoardingPageIndex = 0.obs;
  bool get isLastPage =>
      onBoardingPageIndex.value == onBoardingPages.length - 1;
  PageController pageController = PageController();

  getToLastPage() => pageController.jumpToPage(2);

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo('assets/imgs/page1.png', 'Order Your Food',
        'Now you can order food any time  right from your mobile.'),
    OnBoardingInfo('assets/imgs/page2.png', 'Cooking Safe Food',
        'We are maintain safty and We keep clean while making food.'),
    OnBoardingInfo('assets/imgs/page3.png', 'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
